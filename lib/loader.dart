import 'package:get_it/get_it.dart';
import 'package:vptrics/app_route.dart';

/// A static  class with an init method to load dependencies
class AppLoader {
  AppLoader() {
    throw new Exception("[AppLoader] can't be instantiated");
  }
  static void init() {
    GetIt.I.registerSingleton(new AppRoute());
  }
}
