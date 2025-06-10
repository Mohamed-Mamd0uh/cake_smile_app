import 'package:cake_and_smile/features/personalization/controllers/user_controller.dart';
import 'package:cake_and_smile/localization/local_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Import the generated file

import 'firebase_options.dart';
import 'localization/locali.dart';
import 'navigation_menu.dart';
import 'data/services/setting_service.dart';

import 'utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initservice();
  runApp(const MyApp());
}

Future<void> initservice() async {
  await Get.putAsync(() => SettingService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final localController = Get.put(LocalController());
    Get.put(UserController());
    return GetMaterialApp(
        locale: localController.currentLocale.value,
        translations: TranslationService(),
        title: 'Cake & Smile',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: MAppTheme.lightTheme,
        darkTheme: MAppTheme.darkTheme,
        home: const NavigationMenu());
  }
}
