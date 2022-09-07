import 'package:flutter/material.dart';
import 'package:flutter_lala_kids/global/app_languages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:ui' as ui;

class LanguageController extends GetxController {
  static LanguageController get to => Get.find();
  String currentLanguage = "";
  final store = GetStorage();

  @override
  void onReady() async {
    // setInitialLocalLanguage();
    super.onInit();
  }

  // Gets current language stored
  String get currentLanguageStore {
    currentLanguage = store.read('language') ?? '';
    return currentLanguage;
  }

  // Retrieves and Sets language based on device settings
  setInitialLocalLanguage() {
    if (currentLanguageStore == '') {
      String deviceLanguage = ui.window.locale.toString();
      deviceLanguage = deviceLanguage.substring(0, 2); //only get 1st 2 characters
      updateLanguage(deviceLanguage);
    }
  }

  // gets the language locale app is set to
  Locale? get getLocale {
    if (currentLanguageStore == '') {
      currentLanguage = AppLanguages.defaultLanguage;
      updateLanguage(AppLanguages.defaultLanguage);
    } else if (currentLanguageStore != '') {
      //set the stored string country code to the locale
      return Locale(currentLanguageStore);
    }
    // gets the default language key for the system.
    return Get.deviceLocale;
  }

// updates the language stored
  Future<void> updateLanguage(String value) async {
    currentLanguage = value;
    await store.write('language', value);
    if (getLocale != null) {
      Get.updateLocale(getLocale!);
    }
    update();
  }
}
