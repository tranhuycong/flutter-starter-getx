import 'package:flutter/material.dart';
import 'package:flutter_starter_getx/commons/common_button.dart';
import 'package:flutter_starter_getx/pages/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SignInUI extends StatelessWidget {
  SignInUI({Key? key}) : super(key: key);
  final authController = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "auth.signIn.headerTitle".tr,
                  style: Theme.of(context).textTheme.headline1,
                ),
                TextFormField(
                  controller: authController.emailController,
                  decoration: InputDecoration(
                    hintText: 'auth.signIn.emailHint'.tr,
                  ),
                ),
                TextFormField(
                  controller: authController.passwordController,
                  decoration: InputDecoration(
                    hintText: 'auth.signIn.passwordHint'.tr,
                  ),
                ),
                const SizedBox(height: 20),
                CommonButtons(
                  onPress: () async {
                    authController.signInWithEmailAndPassword();
                  },
                  title: "auth.signInButton".tr,
                ),
                const SizedBox(height: 50),
                const Text("Hint: test@gmail.com, password"),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
