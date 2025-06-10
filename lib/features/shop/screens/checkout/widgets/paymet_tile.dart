import 'package:cake_and_smile/features/shop/controllers/checkout_controller.dart';
import 'package:cake_and_smile/features/shop/models/payment_method_model.dart';
import 'package:cake_and_smile/shared/widgets/containers/rounded_container.dart';
import 'package:cake_and_smile/utils/constants/colors.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MPaymentTile extends StatelessWidget {
  const MPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckoutController>();

    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      // Leading
      leading: MRoundedContainer(
        width: 60,
        height: 48,
        backgroundColor: MColors.white,
        padding: const EdgeInsets.all(MSizes.sm),
        child:
            Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ), // RoundedContainer
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    ); // ListTile
  }
}
