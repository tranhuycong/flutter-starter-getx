// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
import 'package:flutter_lala_kids/global/export_controllers.dart';
import 'package:flutter_lala_kids/global/export_views.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object

  static String HomePage = "/";

  // auth page
  static String SplashPage = "/splash";
  static String LoginPage = "/login";
  static final routes = [
    GetPage(
      name: HomePage,
      page: () => HomeUI(),
      binding: BindingsBuilder(() => Get.lazyPut(() => HomeController())),
    ),
    GetPage(
      name: SplashPage,
      page: () => SplashUI(),
      binding: BindingsBuilder(() => Get.lazyPut(() => SplashController())),
    ),

    // Login Routes
    GetPage(
      name: LoginPage,
      page: () => SignInUI(),
      binding: BindingsBuilder(() => Get.lazyPut(() => AuthController())),
    ),
  ];
}
