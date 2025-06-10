import 'package:cake_and_smile/features/personalization/controllers/address_controller.dart';
import 'package:cake_and_smile/shared/widgets/text/section_heading.dart';
import 'package:cake_and_smile/utils/constants/colors.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MBillingAddressSection extends StatelessWidget {
  const MBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = MHelperFunctions.isDarkMode(context);
    final controller = Get.find<AddressControllers>();
    return Obx(
      () =>  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MSectionHeading(
            titel: 'Shipping Adress ',
            buttonTitel: 'change',
            onPressed: () => controller.selectNewAddressPopup(context),
          ),
          //================//
          controller.selectedAddress.value.id.isNotEmpty
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.selectedAddress.value.name,
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: MSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Icons.phone, size: 16, color: MColors.grey),
                        const SizedBox(width: MSizes.spaceBtwItems),
                        Text(controller.selectedAddress.value.phoneNumber,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_history,
                            size: 16, color: MColors.grey),
                        const SizedBox(width: MSizes.spaceBtwItems),
                        Text(controller.selectedAddress.value.toString(),
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ],
                )
              : Text('Select Address ',
                  style: Theme.of(context).textTheme.bodyMedium)
        ],
      ),
    );
  }
}
