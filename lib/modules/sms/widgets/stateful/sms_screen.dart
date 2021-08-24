import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';
import 'package:vptrics/modules/auth/widgets/stateless/act_on_signout.dart';
import 'package:vptrics/modules/patients/models/patient.model.dart';
import 'package:vptrics/modules/patients/patients.service.dart';
import 'package:vptrics/modules/sms/sms.service.dart';
import 'package:vptrics/modules/sms/widgets/stateful/models/sms.model.dart';
import 'package:vptrics/shared_widgets/stateless/loading_screen.dart';
import 'package:vptrics/shared_widgets/stateless/not_found.dart';
import 'package:vptrics/shared_widgets/stateless/page_centered_not_found.dart';
import 'package:vptrics/styles/app_icons.dart';

class SmsScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  static const String route = "SmsScreen";
  final SmsScreenData data;
  SmsScreen({Key? key, required this.data}) : super(key: key);

  @override
  _SmsScreenState createState() => _SmsScreenState();
}

class _SmsScreenState extends State<SmsScreen> with GetItStateMixin {
  bool _loading = false;
  final FocusNode _focusNode = FocusNode();

  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Patient? patient = watchOnly<PatientsService, Patient?>(
        (service) => service.getByRef(widget.data.ref));

    SmsService service = get<SmsService>();
    List<Sms> messages = watchOnly<SmsService, List<Sms>>(
        (service) => service.forPatient(widget.data.ref));

    List<Widget> children = [];
    messages.forEach((message) {
      children.addAll([
        Card(
          color: Theme.of(context).cardColor.withOpacity(.8),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  ReCase(message.message).sentenceCase,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 12,
                ),
                if (message.isSent)
                  Text(
                    "${DateFormat.yMMMd().format(message.time)} @ ${DateFormat.jms().format(message.time)}",
                    // "21 June, 2021 @ 5:15pm",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize:
                              Theme.of(context).textTheme.caption?.fontSize,
                        ),
                    textAlign: TextAlign.end,
                  ),
                if (!message.isSent)
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        _loading = true;
                      });

                      try {
                        await service.sendSms(message, patient?.phone ?? '');
                      } catch (e) {}
                      setState(() {
                        _loading = false;
                      });
                    },
                    child: Text(
                      "Retry",
                    ),
                  ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 24,
        ),
      ]);
    });

    if (children.length > 0) children.removeLast();

    return ActOnSignout(
      child: LoadingScreen(
        loading: _loading,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Scaffold(
            appBar: AppBar(
              title:
                  Text("SMS: ${ReCase(patient?.name ?? 'Patient').titleCase}"),
              centerTitle: true,
            ),
            body: SafeArea(
                child: children.length > 0
                    ? SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 16,
                            left: 64,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            verticalDirection: VerticalDirection.up,
                            children: children,
                          ),
                        ),
                      )
                    : PageCenteredNotFound(
                        child: NotFound(
                          title: "No Message yet",
                          action: ElevatedButton(
                            onPressed: () {
                              _focusNode.requestFocus();
                            },
                            child: Text("Send Message"),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      )),
            bottomNavigationBar: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: TextFormField(
                controller: _messageController,
                autofocus: false,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  fillColor: Theme.of(context).cardColor.withOpacity(.8),
                  hintText: "Type message here ...",
                  enabledBorder: (Theme.of(context)
                          .inputDecorationTheme
                          .enabledBorder as OutlineInputBorder)
                      .copyWith(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  focusedBorder: (Theme.of(context)
                          .inputDecorationTheme
                          .focusedBorder as OutlineInputBorder)
                      .copyWith(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      setState(() {
                        _loading = true;
                      });

                      try {
                        await service.sendSms(
                          new Sms(
                            message: _messageController.text,
                            time: DateTime.now(),
                            isSent: false,
                            patientRef: widget.data.ref,
                          ),
                          patient?.phone ?? '',
                        );
                      } catch (e) {}
                      _messageController.text = "";
                      setState(() {
                        _loading = false;
                      });
                    },
                    icon: Icon(AppIcons.send),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SmsScreenData {
  final DocumentReference ref;

  SmsScreenData({required this.ref});

  SmsScreenData copyWith({
    DocumentReference? ref,
  }) {
    return SmsScreenData(
      ref: ref ?? this.ref,
    );
  }
}
