import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ar_AR/ar_ar_translation.dart';

class LocalizationService extends Translations {
  // default language
  static Locale defaultLanguage = supportedLanguages['ar']!;

  // supported languages
  static Map<String, Locale> supportedLanguages = {
    'ar': const Locale('ar', 'SA'),
  };

  // supported languages fonts family (must be in assets & pubspec yaml) or you can use google fonts
  static Map<String, TextStyle> supportedLanguagesFontsFamilies = {
    'ar': const TextStyle(fontFamily: 'Cairo'),
  };

  @override
  Map<String, Map<String, String>> get keys => {
        'ar': ArabicLocale.arSA,
      };

  /// check if the language is supported
  static isLanguageSupported(String languageCode) =>
      supportedLanguages.keys.contains(languageCode);

  /// update app language by code language for example (en,ar..etc)
  static updateLanguage(String languageCode) async {
    // check if the language is supported
    if (!isLanguageSupported(languageCode)) return;
    // update current language in shared pref

    await Get.updateLocale(supportedLanguages[languageCode]!);
  }

  /// check if the language is english

  /// get current locale
  static Locale getCurrentLocal() => const Locale('ar');
}
