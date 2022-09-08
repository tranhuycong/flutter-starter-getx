import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'global/app_themes.dart';
import 'global/constants.dart';
import 'global/environment.dart';
import 'global/localization.dart';
import 'pages/app_config/controllers/language_controller.dart';
import 'pages/auth/controllers/auth_controller.dart';

void main() async {
  await dotenv.load(fileName: Environment.fileName);

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // put global controller first
  Get.put<AuthController>(AuthController());
  Get.put<LanguageController>(LanguageController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      builder: (languageController) {
        return GetMaterialApp(
          translations: Localization(),
          locale: languageController.getLocale,
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          themeMode: ThemeMode.system,
          initialRoute: AppRoutes.SplashPage,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
