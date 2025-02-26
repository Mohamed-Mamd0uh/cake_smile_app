import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'utils/constants/colors.dart';
import 'utils/helpers/helper_functions.dart';
import 'features/bakery/screens/home/home.dart';
import 'features/bakery/screens/cart/cart.dart';
import 'features/bakery/screens/favorite/favourite.dart';
import 'features/bakery/screens/profile/profile.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = MHelperFunctions.isDarkMode(context);
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
            backgroundColor: dark ? MColors.black : MColors.white,
            indicatorColor: dark
                ? MColors.white.withOpacity(0.1)
                : MColors.black.withOpacity(0.1),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Iconsax.home), label: 'الرئيسية'),
              NavigationDestination(
                  icon: Icon(Iconsax.shopping_cart), label: 'السلة'),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: 'المفضلة'),
              NavigationDestination(
                  icon: Icon(Iconsax.profile_circle), label: 'حسابي'),
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
              Profile(),
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
    const Profile(),
  ];
}
