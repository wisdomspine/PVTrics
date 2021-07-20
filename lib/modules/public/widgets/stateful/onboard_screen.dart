import 'package:flutter/material.dart';
import 'package:vptrics/modules/public/widgets/stateless/onboard_image.dart';

class OnboardScreen extends StatefulWidget {
  static const String route = "OnboardScreen";
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(
              flex: 3,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 20),
              child: IntrinsicHeight(
                child: OnboardImage(),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Access and analyze patients metrics\n from ",
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                  children: [
                    TextSpan(
                      text: "Anywhere at Anytime",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to login screen
                },
                child: Text(
                  "Get Started",
                  style: Theme.of(context).accentTextTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
