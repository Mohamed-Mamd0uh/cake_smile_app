import 'package:cake_and_smile/features/personalization/screens/settings/settings.dart';
import 'package:cake_and_smile/features/shop/screens/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'utils/constants/colors.dart';

import 'features/shop/screens/home/home.dart';

import 'features/shop/screens/favorite/favourite.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            elevation: 0,
            height: 80,
            selectedIndex: controller.selectIndex.value,
            onDestinationSelected: (value) {
              controller.selectIndex.value = value;
              controller.pageController.jumpToPage(value);
            },
            backgroundColor: MColors.white,
            indicatorColor: MColors.black.withOpacity(0.1),
            destinations: [
              NavigationDestination(
                  icon: Icon(Iconsax.home), label: 'navHome'.tr),
              NavigationDestination(
                  icon: Icon(Iconsax.shopping_cart), label: 'navCart'.tr),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: 'navFavorites'.tr),
              NavigationDestination(
                  icon: Icon(Iconsax.profile_circle), label: 'navAccount'.tr),
            ],
          ),
        ),
        body: GetBuilder<NavigationController>(
          builder: (controller) => PageView(
            controller: controller.pageController,
            onPageChanged: (value) => controller.selectIndex.value = value,
            children: const [
              Home(),
              Cart(),
              FavouriteScreen(),
              SettingsScreen(),
            ],
          ),
        ));
  }
}

class NavigationController extends GetxController {
  var selectIndex = 0.obs;
  final pageController = PageController(initialPage: 0);
  final screens = [
    const Home(),
    const Cart(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
}
