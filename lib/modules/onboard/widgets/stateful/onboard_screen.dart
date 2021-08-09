import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:vptrics/modules/auth/widgets/stateful/login_screen.dart';
import 'package:vptrics/modules/core/services/app_info.service.dart';
import 'package:vptrics/modules/onboard/widgets/stateless/onboard_image.dart';
import 'package:vptrics/shared_widgets/stateless/loading_screen.dart';

class OnboardScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  static const String route = "OnboardScreen";
  OnboardScreen({Key? key}) : super(key: key);

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> with GetItStateMixin {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      loading: _loading,
      child: Scaffold(
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
                    setState(() {
                      _loading = true;
                    });
                    get<AppInfoService>().launched().then((value) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginScreen.route, (route) => false);
                    }).catchError((error) {
                      setState(() {
                        _loading = false;
                      });
                    });
                  },
                  child: Text(
                    "Get Started",
                    style:
                        Theme.of(context).accentTextTheme.subtitle1?.copyWith(
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
      ),
    );
  }
}
