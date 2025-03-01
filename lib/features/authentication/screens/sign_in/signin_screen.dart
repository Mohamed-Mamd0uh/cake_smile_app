import 'package:cake_and_smile/shared/form_divider.dart';
import 'package:cake_and_smile/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/constants/text_strings.dart';
import 'package:get/get.dart';

import '../../../../shared/widgets/signin_signup/social_buttons.dart';

import 'widget/signin_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: MSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                MImages.lightAppLogo,
                height: 120,
              ),

              /// Title
              Text(
                MTexts.loginTitle.tr,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: MSizes.spaceBtwSections),

              /// Form
              SignInForm(),
              const SizedBox(height: MSizes.spaceBtwSections),

              /// Divider
              FormDivider(dividerText: MTexts.orSignInWith.tr),
              const SizedBox(height: MSizes.spaceBtwSections),

              /// Social Buttons
              const MSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
