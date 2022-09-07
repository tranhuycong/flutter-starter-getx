import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'global/app_themes.dart';
import 'global/constants.dart';
import 'global/localization.dart';
import 'pages/app_config/controllers/language_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put<LanguageController>(LanguageController());
  runApp(DevicePreview(
    // enabled: !kReleaseMode,
    enabled: false,
    builder: (context) => MyApp(),
  ));
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
