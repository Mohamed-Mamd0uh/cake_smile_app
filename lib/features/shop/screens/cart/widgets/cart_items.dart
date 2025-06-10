import 'package:cake_and_smile/features/shop/controllers/cart_controller.dart';
// import 'package:cake_and_smile/features/shop/screens/checkout/checkout_2.dart';
import 'package:cake_and_smile/utils/constants/colors.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_item.dart';

class MCartItems extends StatelessWidget {
  const MCartItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final cartController = Get.find<CartController>();

    return Column(
      children: [
        GetBuilder<CartController>(
          builder: (controller) => ListView.separated(
            padding: const EdgeInsets.all(8),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.cartItems.length,
            itemBuilder: (_, index) {
              final cartItem = controller.cartItems[index];
              return Dismissible(
                  background: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: MColors.error,
                    ),
                    margin: const EdgeInsets.only(top: 16),
                    padding: const EdgeInsets.all(8),
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.delete,
                        color: MColors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    controller.removeFromCart(cartItem);
                  },
                  key: ValueKey(cartItem.productId),
                  child: CartItem(item: cartItem));
            },
            separatorBuilder: (_, __) => SizedBox(height: MSizes.spaceBtwItems),
          ),
        ),
        // Container(
        //   padding: const EdgeInsets.all(16),
        //   decoration: BoxDecoration(
        //     color: Theme.of(context).cardColor,
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.black.withOpacity(0.05),
        //         blurRadius: 10,
        //       )
        //     ],
        //   ),
        // child: SafeArea(
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //             'الإجمالي:',
        //             style: Theme.of(context).textTheme.titleLarge,
        //           ),
        //           Obx(() => Text(
        //                 '${cartController.totalCartPrice.value} ريال',
        //                 style: Theme.of(context).textTheme.titleLarge,
        //               )),
        //         ],
        //       ),
        // const SizedBox(height: 16),
        // SizedBox(
        //   width: double.infinity,
        //   child: ElevatedButton(
        //     onPressed: () {
        //       Get.to(() => const Checkout2Screen());
        //     },
        //     style: ElevatedButton.styleFrom(
        //       padding: const EdgeInsets.all(16),
        //     ),
        //     child: const Text('إتمام الطلب'),
        //   ),
        // ),
        //     ],
        //   ),
        // ),
        // ),
      ],
    );
  }
}
