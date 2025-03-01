import 'package:cake_and_smile/utils/constants/colors.dart';
import 'package:cake_and_smile/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                title: MTexts.onBoardingTitle1.tr,
                subtitle: MTexts.onBoardingSubTitle1.tr,
                description: MTexts.onboardingDescription1.tr,
              ),
              OnboardingScreen(
                image: MImages.onBoardingImage2,
                title: MTexts.onBoardingTitle2.tr,
                subtitle: MTexts.onBoardingSubTitle2.tr,
                description: MTexts.onboardingDescription2.tr,
              ),
              OnboardingScreen(
                image: MImages.onBoardingImage1,
                title: MTexts.onBoardingTitle3.tr,
                subtitle: MTexts.onBoardingSubTitle3.tr,
                description: MTexts.onboardingDescription3.tr,
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