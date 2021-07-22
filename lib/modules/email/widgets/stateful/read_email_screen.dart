import 'package:flutter/material.dart';

class ReadEmailScreen extends StatefulWidget {
  static const String route = "ReadEmailScreen";
  const ReadEmailScreen({Key? key}) : super(key: key);

  @override
  _ReadEmailScreenState createState() => _ReadEmailScreenState();
}

class _ReadEmailScreenState extends State<ReadEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    text: "Okwute Thankgod <",
                    style: Theme.of(context).textTheme.subtitle1,
                    children: [
                      TextSpan(
                        text: "okwute@gmail.com",
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
                  "Weekly Report",
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
                      List.filled(3,
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in consequat odio. Mauris id placerat quam, ut sagittis est. Quisque eget sapien id felis feugiat faucibus a sit amet dolor. Ut id bibendum felis. Vivamus ac neque accumsan, pretium tortor at, facilisis metus. Nunc iaculis, nulla eget accumsan tempor, mi.")
                          .join("\n\n"),
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
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
    );
  }
}
