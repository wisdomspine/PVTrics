import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:recase/recase.dart';
import 'package:vptrics/modules/auth/widgets/stateless/act_on_signout.dart';
import 'package:vptrics/modules/email/email.service.dart';
import 'package:vptrics/modules/email/models/email.model.dart';
import 'package:vptrics/shared_widgets/stateless/loading_screen.dart';

class ReadEmailScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  static const String route = "ReadEmailScreen";
  final ReadEmailScreenData data;
  ReadEmailScreen({Key? key, required this.data}) : super(key: key);

  @override
  _ReadEmailScreenState createState() => _ReadEmailScreenState();
}

class _ReadEmailScreenState extends State<ReadEmailScreen>
    with GetItStateMixin {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    Email? email = watchOnly<EmailService, Email?>(
        (service) => service.getByRef(widget.data.ref));
    EmailService service = get<EmailService>();

    return ActOnSignout(
      child: LoadingScreen(
        loading: _loading,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).cardColor.withOpacity(.65),
                  Theme.of(context).cardColor.withOpacity(.35),
                  Theme.of(context).primaryColor.withOpacity(.1),
                ],
              ),
            ),
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Email"),
                actions: [
                  if (!(email?.isSent ?? true))
                    TextButton(
                      onPressed: () async {
                        setState(() {
                          _loading = true;
                        });

                        if (email is Email) await service.sendEmail(email);

                        setState(() {
                          _loading = false;
                        });
                      },
                      child: Text("Resend"),
                    ),
                ],
              ),
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  children: [
                    SizedBox(
                      height: 24,
                    ),

                    // receipient
                    Text("Receipient"),
                    SizedBox(
                      height: 4,
                    ),
                    RichText(
                      text: TextSpan(
                        text:
                            "${ReCase(email?.receipientName ?? '').titleCase}<",
                        style: Theme.of(context).textTheme.subtitle1,
                        children: [
                          TextSpan(
                            text:
                                "${(email?.receipientEmail ?? '').toLowerCase()}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: ">",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    // subject
                    Text("Subject"),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${(email?.subject ?? '').titleCase}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),

                    SizedBox(
                      height: 24,
                    ),
                    // body
                    Card(
                      color: Theme.of(context).cardColor.withOpacity(.7),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          (email?.message ?? '').sentenceCase,
                          style:
                              Theme.of(context).textTheme.subtitle2?.copyWith(
                                    height: 1.5,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ReadEmailScreenData {
  ///
  ///email reference
  final DocumentReference ref;

  ReadEmailScreenData({required this.ref});

  ReadEmailScreenData copyWith({
    DocumentReference? ref,
  }) {
    return ReadEmailScreenData(
      ref: ref ?? this.ref,
    );
  }
}
