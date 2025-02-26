import 'package:cake_and_smile/utils/constants/colors.dart';
import 'package:cake_and_smile/utils/constants/image_strings.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/text_strings.dart';
import '../../controllers/onboarding_controller.dart';
import 'widgets/onboardin_dot_navigation.dart';
import 'widgets/onboarding_button.dart';
import 'widgets/onboarding_screen.dart';
import 'widgets/skip_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      backgroundColor: MColors.lightContainer,
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: (value) {
              controller.updatePageIndicator;
              if (value == 2) {
                controller.isLastPage.value = true;
                controller.currentPage.value = 2;
              }
            },
            children: [
              OnboardingScreen(
                image: MImages.lightAppLogo,
                title: 'onBoardingTitle1'.tr,
                subtitle: "onboardingDescription1".tr,
              ),
              OnboardingScreen(
                image: MImages.onBoardingImage2,
                title: 'onBoardingTitle2'.tr,
                subtitle: "onboardingDescription2".tr,
              ),
              OnboardingScreen(
                image: MImages.onBoardingImage1,
                title: 'onBoardingTitle3'.tr,
                subtitle: "onboardingDescription3".tr,
              ),
            ],
          ),
          const SkipButton(),
          const OnboardinDotNavigation(),
          const OnboardingButton(),
        ],
      ),
    );
  }
}





// onboarding_button