import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/enums.dart';
import '../../../controllers/cart_controller.dart';
import '../../../controllers/weight_customization_controller.dart';
import '../../../models/cart_item_model.dart';

/// عنصر في سلة المشتريات يعرض تفاصيل المنتج
class CartItem extends StatelessWidget {
  // final int stc;
  final CartItemModel item;

  const CartItem({
    super.key,
    required this.item,
    // required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // صورة المنتج
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                // product.imageUrl,
                item.image!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),

            // تفاصيل المنتج
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // product.name,
                    item.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    // 'السعر: ${product.price} ريال',
                    'السعر: ${item.price} ريال',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  item.weight.isNotEmpty
                      ? Text('Weight: ${item.weight}')
                      : item.selectedVariation!.isNotEmpty
                          ? Text('Size: ${item.selectedVariation!['Size']}')
                          : const Text(''),
                ],
              ),
            ),
            item.productType != ProductType.weight.toString()
                ?
                //
                // أزرار التحكم في الكمية
                Row(
                    children: [
                      IconButton(
                        onPressed: () => cartController.addOneToCart(item),
                        icon: const Icon(Icons.add_circle_outline),
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(item.quantity.toString()),
                      IconButton(
                        onPressed: () => cartController.removeOneFromCart(item),
                        icon: const Icon(Icons.remove_circle_outline),
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  )
                //زر التحكم في الوزن
                : IconButton(
                    onPressed: () async {
                      final weightController =
                          Get.put(WeightCustomizationController());

                      final newWeight = await weightController.openDialog(
                          item.stock, item.weight);

                      if (newWeight != null) {
                        cartController
                            .updatePriceForWeightProduct(item.productId);
                      }
                      // تحديث السعر فقط إذا تم إدخال وزن جديد
                    },
                    icon: const Icon(Iconsax.edit),
                  )
          ],
        ),
      ),
    );
  }
}
