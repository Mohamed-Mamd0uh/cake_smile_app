import 'package:cake_and_smile/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/sign_up/signup_screen.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  PageController pageController = PageController();
  final currentPage = 0.obs;
  final isLastPage = false.obs;
  updatePageIndicator(index) => currentPage.value = index;

  void dotClick(index) {
    currentPage.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    // int page = currentPage.value;
    if (currentPage.value == 2) {
      // isLastPage.value = true;
      Get.to(() => const SignUpScreen());
      // Get.to(() => const NavigationMenu());
    } else {
      int page = currentPage.value + 1;
      print("page value: $currentPage \n page: $page");
      pageController.jumpToPage(page);
      if (page == 2) {
        isLastPage.value = true;
      }
      currentPage.value = page;
    }
  }

  void skipPage() {
    currentPage.value = 2;
    pageController.jumpToPage(2);
    isLastPage.value = true;
  }
}
