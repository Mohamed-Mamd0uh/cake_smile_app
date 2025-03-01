import 'package:cake_and_smile/features/authentication/screens/onboarding/onboarding.dart';
import 'package:cake_and_smile/features/authentication/screens/sign_in/signin_screen.dart';
import 'package:cake_and_smile/features/bakery/controllers/product_detail_controller.dart';
import 'package:cake_and_smile/localization/local_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/authentication/screens/sign_up/signup_screen.dart';
import 'features/bakery/controllers/weight_customization_controller.dart';
import 'features/bakery/screens/all_products/all_products.dart';
import 'localization/locali.dart';
import 'navigation_menu.dart';
import 'services/setting_service.dart';
import 'tast.dart';
import 'tast2.dart';

import 'utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initservice();
  runApp(const MyApp());
}

Future initservice() async {
  await Get.putAsync(() => SettingService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    Get.lazyPut(() => WeightCustomizationController());
    return GetMaterialApp(
      locale: controller.initLocal,
      // locale: const Locale('en'),
      translations: TranslationService(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MAppTheme.lightTheme,
      darkTheme: MAppTheme.darkTheme,
      getPages: [
        GetPage(
          name: '/product',
          page: () => const ProductDetailPage(),
          binding: BindingsBuilder(() {
            Get.put(ProductDetailController(Get.arguments));
          }),
        ),
      ],
      home:
          // const ProductDetailPage(),
          // ProductPage()
          // Tast()
          // const AllProductsScreen()
          // const NavigationMenu()
          // const SignInScreen()
          const Onboarding(),
      // const SignUpScreen()
    );
  }
}
