import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';
import 'package:vptrics/modules/auth/widgets/stateless/act_on_signout.dart';
import 'package:vptrics/modules/email/email.service.dart';
import 'package:vptrics/modules/email/forms/email.form.dart';
import 'package:vptrics/modules/email/models/email.model.dart';
import 'package:vptrics/modules/email/widgets/stateful/read_email_screen.dart';
import 'package:vptrics/modules/patients/models/patient.model.dart';
import 'package:vptrics/modules/patients/patients.service.dart';
import 'package:vptrics/shared_widgets/stateless/loading_screen.dart';

class ComposeEmailScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  static const String route = "ComposeEmailScreen";
  final ComposeEmailScreenData data;
  ComposeEmailScreen({Key? key, required this.data}) : super(key: key);

  @override
  _ComposeEmailScreenState createState() => _ComposeEmailScreenState();
}

class _ComposeEmailScreenState extends State<ComposeEmailScreen>
    with GetItStateMixin {
  bool _loading = false;
  EmailForm _form = new EmailForm();
  @override
  Widget build(BuildContext context) {
    final Color formFillColor = Theme.of(context).cardColor.withOpacity(.8);
    Patient? patient = watchOnly<PatientsService, Patient?>(
        (service) => service.getByRef(widget.data.ref));
    EmailService service = get<EmailService>();
    return ActOnSignout(
      child: LoadingScreen(
        loading: _loading,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:
                Text("Send Email: ${ReCase((patient?.name ?? '')).titleCase}"),
          ),
          body: SafeArea(
            child: ReactiveForm(
              formGroup: _form,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText:
                          "Email: ${(patient?.email ?? '').toLowerCase()}",
                    ),
                    enabled: false,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ReactiveTextField(
                    formControlName: EmailForm.subjectControlName,
                    decoration: InputDecoration(
                      fillColor: formFillColor,
                      hintText: "Subject",
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ReactiveTextField(
                    formControlName: EmailForm.messageControlName,
                    minLines: 5,
                    maxLines: 8,
                    decoration: InputDecoration(
                      fillColor: formFillColor,
                      hintText: "Message  goes here ....",
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _form.markAllAsTouched();
                      if (!_form.valid) return;
                      final value = _form.value;
                      DocumentReference ref;
                      setState(() {
                        _loading = true;
                      });
                      ref = await service.sendEmail(Email(
                          receipientEmail: patient?.email ?? '',
                          receipientName: patient?.name ?? 'Dear',
                          subject:
                              value[EmailForm.subjectControlName] as String,
                          message:
                              value[EmailForm.messageControlName] as String,
                          time: DateTime.now(),
                          patientRef: widget.data.ref,
                          isSent: false));
                      try {
                        Navigator.pop(context);
                      } catch (e) {
                        setState(() {
                          _loading = false;
                        });
                      }

                      if (ref is DocumentReference) {
                        Navigator.popAndPushNamed(
                            context, ReadEmailScreen.route,
                            arguments: ReadEmailScreenData(ref: ref));
                      }
                    },
                    child: Text(
                      "Send",
                      style:
                          Theme.of(context).accentTextTheme.subtitle1?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ComposeEmailScreenData {
  final DocumentReference ref;

  ComposeEmailScreenData({required this.ref});

  ComposeEmailScreenData copyWith({
    DocumentReference? ref,
  }) {
    return ComposeEmailScreenData(
      ref: ref ?? this.ref,
    );
  }
}
