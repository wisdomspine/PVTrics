import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vptrics/styles/app_icons.dart';

class SmsScreen extends StatefulWidget {
  static const String route = "SmsScreen";
  const SmsScreen({Key? key}) : super(key: key);

  @override
  _SmsScreenState createState() => _SmsScreenState();
}

class _SmsScreenState extends State<SmsScreen> {
  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Scaffold(
        appBar: AppBar(
          title: Text("SMS: John Doe"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                right: 16,
                left: 64,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Card(
                    color: Theme.of(context).cardColor.withOpacity(.8),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in consequat odio. Mauris id placerat quam,",
                            style: Theme.of(context).textTheme.subtitle2,
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "21 June, 2021 @ 5:15pm",
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.fontSize,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Card(
                    color: Theme.of(context).cardColor.withOpacity(.8),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ).copyWith(bottom: 4),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in consequat odio. Mauris id placerat quam,",
                            style: Theme.of(context).textTheme.subtitle2,
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          TextButton(
                            onPressed: () {
                              // TODO: retry message
                            },
                            child: Text(
                              "Retry",
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: TextFormField(
            controller: _messageController,
            autofocus: true,
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
                onPressed: () {
                  // TODO: search
                },
                icon: Icon(AppIcons.send),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
