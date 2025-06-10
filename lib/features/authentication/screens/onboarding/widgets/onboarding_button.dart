import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/onboarding_controller.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isAr = MHelperFunctions.isArabic();
    final controller = OnboardingController.instance;
    // controller.currentPage.value == 2
    //     ? controller.isLastPage.value = true
    //     : controller.isLastPage.value = false;
    return Positioned(
      bottom: MDeviceUtils.getBottomNavigationBarHeight(),
      left: isAr ? MSizes.defaultSpace : null,
      right: isAr ? null : MSizes.defaultSpace,
      child: ElevatedButton(
        onPressed: () => controller.nextPage(),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Obx(
            () => Text(controller.isLastPage.value ? "getStarted".tr : "next".tr),
          ),
        ),
      ),
    );
  }
}
