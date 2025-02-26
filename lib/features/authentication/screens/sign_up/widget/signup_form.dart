import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'firstName'.tr,
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                ),
              ),
              const SizedBox(width: MSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'lastName'.tr,
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            decoration: InputDecoration(
              labelText: 'username'.tr,
              prefixIcon: const Icon(Icons.person_2_outlined),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            decoration: InputDecoration(
              labelText: 'email'.tr,
              prefixIcon: const Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            decoration: InputDecoration(
              labelText: 'phoneNo'.tr,
              prefixIcon: const Icon(Icons.phone_outlined),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Password
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'password'.tr,
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: const Icon(Icons.remove_red_eye_rounded),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Terms & Conditions Checkbox
          Row(
            children: [
              Checkbox(value: true, onChanged: (value) {}),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'iAgreeTo'.tr),
                    TextSpan(
                      text: 'privacyPolicy'.tr,
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' ${'and'.tr} ',
                    ),
                    TextSpan(
                      text: 'termsOfUse'.tr,
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: MSizes.spaceBtwItems),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('createAccount'.tr),
            ),
          ),
        ],
      ),
    );
  }
}
