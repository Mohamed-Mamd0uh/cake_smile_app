import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../services/setting_service.dart';

class LocalController extends GetxController {
  late SettingService c;
  late Locale initLocal;

  @override
  void onInit() {
    super.onInit();
    c = Get.find();
    initLocal = c.sharedref.getString('local') == null
        ? Get.deviceLocale!
        : Locale(c.sharedref.getString('local')!);
  }

  //  c = Get.find();
  //  initLocal = c.sharedref.getString('local') == 'ar'
  //     ? const Locale('ar')
  //     : const Locale('en');
  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    c.sharedref.setString('local', codeLang);
    Get.updateLocale(locale);
  }
}
