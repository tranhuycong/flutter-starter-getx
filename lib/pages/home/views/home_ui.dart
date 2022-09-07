import 'package:flutter/material.dart';
import 'package:flutter_lala_kids/commons/common_button.dart';
import 'package:flutter_lala_kids/commons/dropdown_picker.dart';
import 'package:flutter_lala_kids/global/app_languages.dart';
import 'package:flutter_lala_kids/pages/app_config/controllers/language_controller.dart';
import 'package:flutter_lala_kids/pages/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class HomeUI extends StatelessWidget {
  HomeUI({Key? key}) : super(key: key);
  final authController = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "home.title".tr,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 20),
            Text(
              "Hi ${authController.userModel.name}!",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 20),
            languageListTile(context),
            const SizedBox(height: 20),
            CommonButtons(
              onPress: () async {
                authController.signOut();
              },
              title: "home.button.signOut".tr,
            ),
          ],
        ),
      ),
    );
  }

  languageListTile(BuildContext context) {
    return GetBuilder<LanguageController>(
      builder: (controller) => ListTile(
        title: Text("home.settings.language".tr),
        trailing: DropdownPicker(
          menuOptions: AppLanguages.languageOptions,
          selectedOption: controller.currentLanguage,
          onChanged: (value) async {
            await controller.updateLanguage(value!);
            // Get.forceAppUpdate();
          },
        ),
      ),
    );
  }
}
