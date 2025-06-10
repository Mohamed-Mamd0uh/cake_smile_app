import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../data/services/setting_service.dart';

class LocalController extends GetxController {
  late SettingService c;
  final Rx<Locale> currentLocale = Get.deviceLocale!.obs;

  @override
  void onInit() {
    super.onInit();
    c = Get.find();
    String? savedLocale = c.sharedref.getString('local');
    if (savedLocale != null) {
      currentLocale.value = Locale(savedLocale);
    }
  }

  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    c.sharedref.setString('local', codeLang);
    currentLocale.value = locale;
    Get.updateLocale(locale);
  }

  bool get isArabic => currentLocale.value.languageCode == 'ar';
}
