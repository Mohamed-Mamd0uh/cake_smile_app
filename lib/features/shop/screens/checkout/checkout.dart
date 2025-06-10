import 'package:cake_and_smile/features/personalization/controllers/address_controller.dart';
import 'package:cake_and_smile/features/shop/controllers/checkout_controller.dart';

import 'package:cake_and_smile/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:cake_and_smile/shared/widgets/coupon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/widgets/appbar/appbar.dart';

import '../../../../shared/widgets/containers/rounded_container.dart';

import '../../../../utils/constants/colors.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/helpers/pricing_calculator.dart';
import '../../../../utils/loader/loaders.dart';
import '../../../../features/shop/controllers/cart_controller.dart';
import '../../../../features/shop/controllers/order_controller.dart';

import '../../../../features/shop/screens/checkout/widgets/billing_address_section.dart';
import '../../../../features/shop/screens/checkout/widgets/billing_amount_section.dart';

import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressControllers());
    Get.put(CheckoutController());
    final dark = MHelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;
    final orderController = Get.put(OrderControllers());
    final totalAmount = MPricingCalculator.calculateTotalPrice(subTotal, 'EG');

    return Scaffold(
      appBar: MAppBar(
        titel: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
        backArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              const MCartItems(),
              const SizedBox(height: MSizes.spaceBtwSections),
              //====
              const Text('Coupon Code'),
              const MCouponCode(),
              const SizedBox(height: MSizes.spaceBtwSections),
              //===

              MRoundedContainer(
                padding: const EdgeInsets.all(MSizes.md),
                backgroundColor: dark ? MColors.black : MColors.white,
                showBorder: true,
                child: const Column(children: [
                  MBillingAmountSection(),
                  SizedBox(height: MSizes.spaceBtwItems),
                  //===
                  Divider(),
                  SizedBox(height: MSizes.spaceBtwItems),
                  //==
                  MBillingPaymentSection(),
                  SizedBox(height: MSizes.spaceBtwItems),
                  //===
                  MBillingAddressSection(),
                  SizedBox(height: MSizes.spaceBtwItems),
                ]),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmount)
                : () => Mloaders.errorSnackBar(
                    title: 'Error',
                    message: 'Add item in the cart in order to proceed.'),
            child: Text(
                'Checkout \$${MPricingCalculator.calculateTotalPrice(subTotal, 'EG')}')),
      ),
    );
  }
}
