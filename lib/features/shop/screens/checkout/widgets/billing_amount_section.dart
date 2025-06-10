import 'package:cake_and_smile/features/shop/controllers/cart_controller.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';



class MBillingAmountSection extends StatelessWidget {
  const MBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtatal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$$subTotal', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping', style: Theme.of(context).textTheme.bodyMedium),
            Text(
                '\$${MPricingCalculator.calculateShippingCost(subTotal, 'EG')}',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${MPricingCalculator.calculateTax(subTotal, 'EG')}',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order total', style: Theme.of(context).textTheme.bodyMedium),
            Text(
                '\$${MPricingCalculator.calculateTotalPrice(subTotal, 'EG')}',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2),
      ],
    );
  }
}
