import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class TranslationsHelper2 {
  TranslationsHelper2();

  static setDeviceLanguage(context, language) async {
    print(language + " geldi 1");
    if (language == "tr") {
      print(language + " geldi 2");
      EasyLocalization.of(context)!.setLocale(Locale("tr", "TR"));
    } if(language == "en") {
      print(language + " geldi 2");
      EasyLocalization.of(context)!.setLocale(Locale("en", "US"));
    }
  }

  
}
