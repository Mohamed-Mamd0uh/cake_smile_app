import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../controllers/cart_controller.dart';
import 'widgets/cart_item.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('سلة المشتريات'),
      ),
      body: Obx(() => cartController.cartItems.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.shopping_cart, size: 64),
                  SizedBox(height: 16),
                  Text('سلة المشتريات فارغة'),
                ],
              ),
            )
          : Column(
              children: [
                GetBuilder<CartController>(
                  builder: (controller) => Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
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

                        // CartItem(item: cartItem);
                      },
                    ),
                  ),
                ),
                Container(
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
                              'الإجمالي:',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Obx(() => Text(
                                  '${cartController.totalCartPrice.value} ريال',
                                  style: Theme.of(context).textTheme.titleLarge,
                                )),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(16),
                            ),
                            child: const Text('إتمام الطلب'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
    );
  }
}
