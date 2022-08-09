import 'package:flutter/material.dart';
import 'package:flutter_mobile/generated/locales.g.dart';
import 'package:flutter_mobile/global/app_const.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationService extends Translations {
  static Locale get locale => _getLocaleFromLanguage();

  static List<Locale> locales = <Locale>[
    Locale('vi', ''),
    Locale('en', ''),
  ];

// fallbackLocale là locale default nếu locale được set không nằm trong những Locale support
  static final Locale fallbackLocale = Locale('vi');

  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        AppConst.langEN: Locales.en,
        AppConst.langVI: Locales.vi
      };

  static Future<void> changeLocale(String langCode) async {
    GetStorage().write(AppConst.langID, langCode);
    await Get.updateLocale(Locale(langCode));
  }

  static Locale _getLocaleFromLanguage() {
    final String? langCode = GetStorage().read<String?>(AppConst.langID);
    return Locale(langCode ?? 'vi');
  }
}
