import 'package:cake_and_smile/features/shop/controllers/checkout_controller.dart';
import 'package:cake_and_smile/shared/widgets/containers/rounded_container.dart';
import 'package:cake_and_smile/shared/widgets/text/section_heading.dart';
import 'package:cake_and_smile/utils/constants/colors.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MBillingPaymentSection extends StatelessWidget {
  const MBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());

 

    return Column(
      children: [
        MSectionHeading(
          titel: 'Payment Method',
          buttonTitel: 'change',
          onPressed: () => controller.selectPaymentMethod(context),
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2),
        Obx(
          () =>  Row(
            children: [
              MRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor:  MColors.white,
                child:  Image(image: AssetImage(controller.selectedPaymentMethod.value.image)),
              ),
              const SizedBox(width: MSizes.spaceBtwItems / 2),
              Text(controller.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        )
      ],
    );
  }
}
