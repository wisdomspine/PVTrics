import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';
import 'package:vptrics/modules/auth/widgets/stateless/act_on_signout.dart';
import 'package:vptrics/modules/email/models/email.model.dart';
import 'package:vptrics/modules/email/widgets/stateful/compose_email_screen.dart';
import 'package:vptrics/modules/email/widgets/stateful/read_email_screen.dart';
import 'package:vptrics/modules/patients/models/patient.model.dart';
import 'package:vptrics/modules/patients/patients.service.dart';
import 'package:vptrics/shared_widgets/stateless/not_found.dart';
import 'package:vptrics/shared_widgets/stateless/page_centered_not_found.dart';

import '../../email.service.dart';

class EmailsScreen extends StatelessWidget with GetItMixin {
  static const String route = "EmailsScreen";
  final EmailsScreenData data;

  EmailsScreen({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Patient? patient = watchOnly<PatientsService, Patient?>(
        (service) => service.getByRef(data.ref));

    List<Email> emails = watchOnly<EmailService, List<Email>>(
        (service) => service.forPatient(data.ref));

    List<Widget> children = [];

    emails.forEach((email) {
      children.addAll([
        SizedBox(
          height: 16,
        ),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Theme.of(context).dividerColor.withOpacity(.15),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              ReadEmailScreen.route,
              arguments:
                  ReadEmailScreenData(ref: email.ref as DocumentReference),
            );
          },
          tileColor: Theme.of(context).cardColor.withOpacity(.75),
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(
              patient?.photo ?? '',
            ),
          ),
          title: Text(ReCase(email.subject).titleCase),
          subtitle: Text(
            ReCase(email.message).sentenceCase,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            email.isSent ? DateFormat.yMd().format(email.time) : "Failed",
            style: Theme.of(context).textTheme.caption?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: !email.isSent ? Theme.of(context).errorColor : null,
                ),
          ),
        ),
      ]);
    });

    return ActOnSignout(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Text("Emails: ${ReCase(patient?.name ?? 'Patient').titleCase}"),
        ),
        body: SafeArea(
          child: children.length > 0
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: children,
                  ),
                )
              : PageCenteredNotFound(
                  child: NotFound(
                    title: "No Emails yet",
                    action: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          ComposeEmailScreen.route,
                          arguments: ComposeEmailScreenData(ref: data.ref),
                        );
                      },
                      child: Text("Send Email"),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              ComposeEmailScreen.route,
              arguments: ComposeEmailScreenData(ref: data.ref),
            );
          },
          child: Text(
            "New",
            style: Theme.of(context).accentTextTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}

class EmailsScreenData {
  final DocumentReference ref;

  EmailsScreenData({required this.ref});

  EmailsScreenData copyWith({
    DocumentReference? ref,
  }) {
    return EmailsScreenData(
      ref: ref ?? this.ref,
    );
  }
}
