import 'package:flutter_lala_kids/global/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final store = GetStorage();
  @override
  void onReady() {
    super.onReady();
    checkUserLogin();
  }

  void checkUserLogin() {
    if (store.read('isSignIn') == 'true') {
      Get.toNamed(AppRoutes.HomePage);
    } else {
      Get.toNamed(AppRoutes.LoginPage);
    }
  }
}
