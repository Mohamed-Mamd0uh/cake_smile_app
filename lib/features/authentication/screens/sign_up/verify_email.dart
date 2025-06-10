import 'package:cake_and_smile/data/repositories/auth_repository.dart';
import 'package:cake_and_smile/utils/constants/image_strings.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/constants/text_strings.dart';
import 'package:cake_and_smile/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/verify_email_controller.dart';

class VerfiyEmailScreen extends StatelessWidget {
  const VerfiyEmailScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerfiyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthRepository.instance.logout(),
            icon: const Icon(Icons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                MImages.lightAppLogo,
                width: MHelperFunctions.screenWidth() * 0.6,
              ),

              //
              const SizedBox(height: MSizes.spaceBtwSections),
              Text(MTexts.confirmEmail.tr,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MSizes.spaceBtwItems),
              Text(email ?? '',
                  style: Theme.of(context).textTheme.labelSmall,
                  textAlign: TextAlign.center),
              const SizedBox(height: MSizes.spaceBtwItems),
              Text(MTexts.confirmEmailSubTitle.tr,
                  style: Theme.of(context).textTheme.labelSmall,
                  textAlign: TextAlign.center),
              const SizedBox(height: MSizes.spaceBtwSections),

              /////
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.checkEmailVerifiedStatus();
                    },
                    child: const Text(MTexts.tContinue)),
              ),

              const SizedBox(height: MSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    controller.sendEmailVerification();
                  },
                  child: const Text(MTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
