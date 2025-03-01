import 'package:cake_and_smile/features/authentication/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/text_strings.dart';

class MTermsCheckbox extends StatelessWidget {
  const MTermsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Row(
      children: [
        Obx(() => Checkbox(
            value: controller.privacyPolicy.value,
            onChanged: (value) {
              controller.privacyPolicy.value = !controller.privacyPolicy.value;
            })),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '${MTexts.iAgreeTo.tr} '),
              TextSpan(
                text: MTexts.privacyPolicy.tr,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: ' ${MTexts.and.tr} ',
              ),
              TextSpan(
                text: MTexts.termsOfUse.tr,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
