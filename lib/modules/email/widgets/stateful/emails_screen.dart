import 'package:flutter/material.dart';
import 'package:vptrics/modules/email/widgets/stateful/compose_email_screen.dart';

class EmailsScreen extends StatefulWidget {
  static const String route = "EmailsScreen";

  const EmailsScreen({Key? key}) : super(key: key);

  @override
  _EmailsScreenState createState() => _EmailsScreenState();
}

class _EmailsScreenState extends State<EmailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Emails: John Doe"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
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
                onTap: () {},
                tileColor: Theme.of(context).cardColor.withOpacity(.75),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    "assets/images/default_passport.jpg",
                  ),
                ),
                title: Text("Weekly report"),
                subtitle: Text(
                  "Your weekly report for this dose is",
                ),
                trailing: Text(
                  "21 Jun",
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
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
                onTap: () {},
                tileColor: Theme.of(context).cardColor.withOpacity(.75),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    "assets/images/default_passport.jpg",
                  ),
                ),
                title: Text("Weekly report"),
                subtitle: Text(
                  "Your weekly report for this dose is",
                ),
              ),
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
                onTap: () {},
                tileColor: Theme.of(context).cardColor.withOpacity(.75),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    "assets/images/default_passport.jpg",
                  ),
                ),
                title: Text("Weekly report"),
                subtitle: Text(
                  "Your weekly report for this dose is",
                ),
              ),
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
                onTap: () {},
                tileColor: Theme.of(context).cardColor.withOpacity(.75),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    "assets/images/default_passport.jpg",
                  ),
                ),
                title: Text("Weekly report"),
                subtitle: Text(
                  "Your weekly report for this dose is",
                ),
              ),
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
                onTap: () {},
                tileColor: Theme.of(context).cardColor.withOpacity(.75),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    "assets/images/default_passport.jpg",
                  ),
                ),
                title: Text("Weekly report"),
                subtitle: Text(
                  "Your weekly report for this dose is",
                ),
              ),
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
                onTap: () {},
                tileColor: Theme.of(context).cardColor.withOpacity(.75),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    "assets/images/default_passport.jpg",
                  ),
                ),
                title: Text("Weekly report"),
                subtitle: Text(
                  "Your weekly report for this dose is",
                ),
              ),
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
                onTap: () {},
                tileColor: Theme.of(context).cardColor.withOpacity(.75),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    "assets/images/default_passport.jpg",
                  ),
                ),
                title: Text("Weekly report"),
                subtitle: Text(
                  "Your weekly report for this dose is",
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            ComposeEmailScreen.route,
          );
        },
        child: Text(
          "New",
          style: Theme.of(context).accentTextTheme.subtitle1,
        ),
      ),
    );
  }
}
