import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:vptrics/app_route.dart';
import 'package:vptrics/loader.dart';
import 'package:vptrics/shared_widgets/stateless/app_launch_scree.dart';
import 'package:vptrics/shared_widgets/stateless/loading_screen.dart';
import 'package:vptrics/shared_widgets/stateless/scaffold_background.dart';
import 'package:vptrics/styles/styles.dart';
import 'package:vptrics/styles/widgets/app_input_decoration.dart';
import './styles/themes/light/theme.dart' as light_theme;
import './styles/typography.dart' as typography;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppLoader.init();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: light_theme.LightThene.bottomNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations(preferredOrientations).then(
    (value) async => runApp(
      MyApp(),
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget with GetItMixin {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = light_theme.LightThene.theme(context);

    return MaterialApp(
      title: 'PVTrics',
      theme: themeData.copyWith(
        textTheme: typography.Typography.textTheme(themeData),
        inputDecorationTheme: AppInputDecoration.theme(themeData),
      ),
      initialRoute: AppLaunchScreen.route,
      onGenerateRoute: get<AppRoute>().onGenerateRoute,
    );
    // if (hasInitialRoute && allIsReady) {

    // } else {
    //   return MaterialApp(
    //     key: notReadyKey,
    //     title: 'PVTrics',
    //     theme: themeData.copyWith(
    //       textTheme: typography.Typography.textTheme(themeData),
    //       inputDecorationTheme: AppInputDecoration.theme(themeData),
    //     ),
    //     home: ScaffoldBackground(
    //       child: LoadingScreen(
    //         child: Scaffold(),
    //         loading: true,
    //       ),
    //     ),
    //   );
    // }
  }
}
