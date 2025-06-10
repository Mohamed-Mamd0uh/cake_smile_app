import 'package:cake_and_smile/features/personalization/controllers/address_controller.dart';
import 'package:cake_and_smile/features/personalization/models/address_model.dart';
import 'package:cake_and_smile/shared/widgets/containers/rounded_container.dart';
import 'package:cake_and_smile/utils/constants/colors.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:iconsax/iconsax.dart';

class MSingleAddress extends StatelessWidget {
  const MSingleAddress({super.key, required this.address, required this.onTap});
  final AddressModel address;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final controller = AddressControllers.instance;
    final isAr = MHelperFunctions.isArabic();
    final dark = MHelperFunctions.isDarkMode(context);
    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: MRoundedContainer(
          padding: const EdgeInsets.all(MSizes.md),
          margin: const EdgeInsets.only(bottom: MSizes.spaceBtwItems),
          width: double.infinity,
          showBorder: true,
          backgroundColor: selectedAddress
              ? MColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? MColors.darkerGrey
                  : MColors.grey,
          child: Stack(
            children: [
              isAr
                  ? Positioned(
                      left: 5,
                      top: 0,
                      child: Icon(
                        selectedAddress ? Iconsax.tick_circle5 : null,
                        color: MColors.dark,
                      ),
                    )
                  : Positioned(
                      right: 5,
                      top: 0,
                      child: Icon(
                        selectedAddress ? Iconsax.tick_circle5 : null,
                        color: MColors.dark,
                      ),
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: MSizes.sm / 2),
                  Text('(+20)${address.phoneNumber}',
                      maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: MSizes.sm / 2),
                  Text(
                    address.toString(),
                    softWrap: true,
                  ),
                  const SizedBox(height: MSizes.sm / 2),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
