import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sign_up/signup_screen.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// Email
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email_outlined),
              labelText: 'email'.tr,
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Password
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outline),
              labelText: 'password'.tr,
              suffixIcon: const Icon(Icons.remove_red_eye_rounded),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Remember Me & Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Remember Me
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  Text('rememberMe'.tr),
                ],
              ),

              /// Forget Password
              TextButton(
                onPressed: () {},
                child: Text('forgetPassword'.tr),
              ),
            ],
          ),
          const SizedBox(height: MSizes.spaceBtwSections),

          /// Sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('signIn'.tr),
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
              child: Text('createAccount'.tr),
            ),
          ),
        ],
      ),
    );
  }
}
