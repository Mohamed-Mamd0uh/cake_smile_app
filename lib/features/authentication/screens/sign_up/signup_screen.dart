import 'package:cake_and_smile/shared/form_divider.dart';
import 'package:cake_and_smile/utils/constants/image_strings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/constants/text_strings.dart';

import '../../../../shared/widgets/signin_signup/social_buttons.dart';
import '../sign_in/signin_screen.dart';
import 'widget/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(MSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: MSizes.defaultSpace),
                Image.asset(MImages.lightAppLogo, height: 120),

                /// Title
                Text(
                  MTexts.signupTitle.tr,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: MSizes.spaceBtwSections),

                /// Form
                 SignUpForm(),
                const SizedBox(height: MSizes.spaceBtwSections),

                /// Divider
                FormDivider(dividerText: MTexts.orSignUpWith.tr),
                const SizedBox(height: MSizes.spaceBtwItems),

                /// Social Buttons
                const MSocialButtons(),

                Center(
                    child: TextButton(
                  onPressed: () => Get.to(() => const SignInScreen()),
                  child: Text.rich(
                    TextSpan(
                      text: MTexts.alreadyHaveAccount.tr,
                      children: [
                        TextSpan(
                          text: ' ${MTexts.signIn.tr}',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
