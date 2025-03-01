import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/signup_controller.dart';
import 'terms_checkbox.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});

  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          /// First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  onFieldSubmitted: (_) => _lastNameFocusNode.requestFocus(),
                  controller: controller.firstName,
                  decoration: InputDecoration(
                    labelText: MTexts.firstName.tr,
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                ),
              ),
              const SizedBox(width: MSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  focusNode: _lastNameFocusNode,
                  onFieldSubmitted: (_) => _usernameFocusNode.requestFocus(),
                  controller: controller.lastName,
                  decoration: InputDecoration(
                    labelText: MTexts.lastName.tr,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            focusNode: _usernameFocusNode,
            onFieldSubmitted: (_) => _emailFocusNode.requestFocus(),
            controller: controller.username,
            decoration: InputDecoration(
              labelText: MTexts.username.tr,
              prefixIcon: const Icon(Icons.person_2_outlined),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            focusNode: _emailFocusNode,
            onFieldSubmitted: (_) => _phoneFocusNode.requestFocus(),
            controller: controller.email,
            decoration: InputDecoration(
              labelText: MTexts.email.tr,
              prefixIcon: const Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            focusNode: _phoneFocusNode,
            onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
            controller: controller.phone,
            decoration: InputDecoration(
              labelText: MTexts.phoneNo.tr,
              prefixIcon: const Icon(Icons.phone_outlined),
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

          /// Terms & Conditions Checkbox
          const MTermsCheckbox(),
          const SizedBox(height: MSizes.spaceBtwItems),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(MTexts.createAccount.tr),
            ),
          ),
        ],
      ),
    );
  }
}
