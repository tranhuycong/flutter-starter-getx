import 'package:flutter/material.dart';
import 'package:flutter_lala_kids/pages/auth/models/user_model.dart';
import 'package:get/get.dart';

import '../repositories/auth_repo.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final _authRepository = AuthRepository();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signInWithEmailAndPassword() async {
    String email = emailController.text;
    String password = passwordController.text;
    try {
      UserModel userModel = await _authRepository.loginWithEmailPassword(email, password);
      print(userModel);
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
