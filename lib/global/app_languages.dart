import 'package:flutter/material.dart';

class MenuOptionsModel {
  final String key;
  final String value;
  final IconData? icon;

  MenuOptionsModel({required this.key, required this.value, this.icon});
}

class AppLanguages {
  static const String defaultLanguage = 'vi';

  static final List<MenuOptionsModel> languageOption = [
    MenuOptionsModel(key: "en", value: "English"), //English
    MenuOptionsModel(key: "vi", value: "Vietnamese"), //Vietnamese
  ];
}
