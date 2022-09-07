import 'package:flutter/material.dart';
import 'package:flutter_lala_kids/global/app_routes.dart';
import 'package:flutter_lala_kids/global/app_store.dart';
import 'package:flutter_lala_kids/pages/auth/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../repositories/auth_repo.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  // controller state
  late UserModel userModel;

  // injection
  final _authRepository = AuthRepository();
  final store = GetStorage();

  // ui
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signInWithEmailAndPassword() async {
    String email = emailController.text;
    String password = passwordController.text;
    try {
      await _authRepository.loginWithEmailPassword(email, password);
      await getUserInfo();
      storeLoggedIn();
      Get.toNamed(AppRoutes.HomePage);
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }

  storeLoggedIn() {
    store.write(AppStore.isSignIn, 'true');
  }

  signOut() {
    store.write(AppStore.isSignIn, '');
    Get.toNamed(AppRoutes.LoginPage);
  }

  getUserInfo() async {
    try {
      userModel = await _authRepository.fetchUser();
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
