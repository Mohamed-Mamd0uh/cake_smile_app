import 'package:cake_and_smile/features/authentication/controllers/signin_controller.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sign_up/signup_screen.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});
  final _passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SigninController());

    return Form(
      key: controller.signinKey,
      child: Column(
        children: [
          /// Email
          TextFormField(
            controller: controller.email,
            onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email_outlined),
              labelText: MTexts.email.tr,
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              obscureText: controller.hidePassword.value,
              focusNode: _passwordFocusNode,
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
              controller: controller.password,
              decoration: InputDecoration(
                labelText: MTexts.password.tr,
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.hidePassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () {
                    controller.togglePasswordVisibility();
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Remember Me & Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Remember Me
              Obx(
                () => Row(
                  children: [
                    Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          controller.rememberMe.value =
                              !controller.rememberMe.value;
                        }),
                    Text(MTexts.rememberMe.tr),
                  ],
                ),
              ),

              /// Forget Password
              TextButton(
                onPressed: () {},
                child: Text(MTexts.forgetPassword.tr),
              ),
            ],
          ),
          const SizedBox(height: MSizes.spaceBtwSections),

          /// Sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.signin();
              },
              child: Text(MTexts.signIn.tr),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwItems),

          /// Create Account
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()),
              ),
              child: Text(MTexts.createAccount.tr),
            ),
          ),
        ],
      ),
    );
  }
}
