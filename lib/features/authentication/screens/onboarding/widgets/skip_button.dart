import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding_controller.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MDeviceUtils.getStatusBarHeight(),
      right: 0,
      child: TextButton(
        onPressed: () {
          OnboardingController.instance.skipPage();
        },
        child: Text('skip'.tr, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
