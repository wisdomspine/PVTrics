import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:vptrics/modules/email/forms/email.form.dart';

class ComposeEmailScreen extends StatefulWidget {
  static const String route = "ComposeEmailScreen";
  const ComposeEmailScreen({Key? key}) : super(key: key);

  @override
  _ComposeEmailScreenState createState() => _ComposeEmailScreenState();
}

class _ComposeEmailScreenState extends State<ComposeEmailScreen> {
  EmailForm _form = new EmailForm();
  @override
  Widget build(BuildContext context) {
    final Color formFillColor = Theme.of(context).cardColor.withOpacity(.8);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Send Email: John Doe"),
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
                  hintText: "Email: okwute@gmail.com",
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
                onPressed: () {
                  // TODO: Create Patient
                  Navigator.pop(context);
                },
                child: Text(
                  "Send",
                  style: Theme.of(context).accentTextTheme.subtitle1?.copyWith(
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
    );
  }
}
