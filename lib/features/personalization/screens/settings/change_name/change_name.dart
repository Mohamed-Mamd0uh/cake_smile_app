import 'package:cake_and_smile/features/personalization/controllers/change_name_controller.dart';
import 'package:cake_and_smile/shared/widgets/appbar/appbar.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/constants/text_strings.dart';
import 'package:cake_and_smile/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = Get.put(UpdateNameControllers());
    return Scaffold(
      appBar: MAppBar(
        backArrow: true,
        titel: Text('Change Name',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: Column(
          children: [
            Form(
              key: controller.changeNameKey,
              child: Column(
                children: [
                  const SizedBox(height: MSizes.spaceBtwSections),
                  // ========firstName=============

                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        MValidator.validateEmptyText('first Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: MTexts.firstName),
                  ),

                  const SizedBox(height: MSizes.spaceBtwInputFields),
                  // ========lastName=============
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        MValidator.validateEmptyText('last Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: MTexts.lastName),
                  ),
                ],
              ),
            ),
              const SizedBox(height: MSizes.spaceBtwSections),
             SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () =>controller.updateUserName(),
                child: const Text('Save')),
          ),
          ],
        ),
      ),
    );
  }
}
