import 'ar_AR/ar_ar_translation.dart';
import 'en_US/en_us_translation.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en': EnglishLocale.enUS,
    'ar': ArabicLocale.arSA,
  };
}
