import 'package:cake_and_smile/features/shop/controllers/cart_controller.dart';
import 'package:cake_and_smile/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:cake_and_smile/features/shop/screens/checkout/checkout.dart';

import 'package:cake_and_smile/utils/constants/text_strings.dart';
import 'package:cake_and_smile/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isAr = MDeviceUtils.isArabic();
    final cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Text('cartTitle'.tr),
      ),
      body: Obx(
        () => cartController.cartItems.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.shopping_cart, size: 64),
                    SizedBox(height: 16),
                    Text('emptyCart'.tr),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MCartItems(),
                ),
              ),
      ),
      bottomNavigationBar: cartController.cartItems.isEmpty
          ? const SizedBox()
          : Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  )
                ],
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'total'.tr + ':',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Obx(() => Text(
                              '${isAr ? 'EG' : ' \$'}${cartController.totalCartPrice.value} ',
                              style: Theme.of(context).textTheme.titleLarge,
                            )),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const CheckoutScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                        ),
                        child: Text(MTexts.checkout.tr),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
/*

Padding(
              padding: const EdgeInsets.all(MSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: () => Get.to(const CheckoutScreen()),
                  child: Obx(() => Text(
                      '${MTexts.checkout.tr} ${isAr ? 'EG' : ' \$'}${cartController.totalCartPrice.value}'))),
            ),



 */