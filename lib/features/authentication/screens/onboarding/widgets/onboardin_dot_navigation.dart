import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding_controller.dart';

class OnboardinDotNavigation extends StatelessWidget {
  const OnboardinDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final isAr = MHelperFunctions.isArabic();
    final controller = OnboardingController.instance;
    return Positioned(
      bottom: MDeviceUtils.getBottomNavigationBarHeight() + 20,
      left: 20,
      right: 20,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotClick,
        count: 3,
        effect: const WormEffect(
          dotColor: MColors.primary,
          activeDotColor: MColors.secondary,
          dotHeight: 6,
        ),
      ),
    );
  }
}
