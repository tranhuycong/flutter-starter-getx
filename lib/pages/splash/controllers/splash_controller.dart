import 'package:flutter_starter_getx/global/app_routes.dart';
import 'package:flutter_starter_getx/global/app_store.dart';
import 'package:flutter_starter_getx/pages/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  // injection
  final authController = AuthController.instance;
  final store = GetStorage();

  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(const Duration(seconds: 1));
    // load app pre info
    await checkUserLogin();
  }

  checkUserLogin() async {
    if (store.read(AppStore.isSignIn) == 'true') {
      await authController.getUserInfo();
      Get.toNamed(AppRoutes.HomePage);
    } else {
      Get.toNamed(AppRoutes.LoginPage);
    }
  }
}
