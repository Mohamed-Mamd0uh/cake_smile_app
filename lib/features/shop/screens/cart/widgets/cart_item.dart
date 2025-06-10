import 'package:cake_and_smile/features/shop/controllers/cart_controller.dart';
import 'package:cake_and_smile/features/shop/controllers/weight_customization_controller.dart';
import 'package:cake_and_smile/features/shop/models/cart_item_model.dart';
import 'package:cake_and_smile/utils/constants/text_strings.dart';
import 'package:cake_and_smile/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/enums.dart';

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
    final bool isAr = MDeviceUtils.isArabic();
    final String currentLanguage = Get.locale!.languageCode;

    return Container(
      padding: const EdgeInsets.only(left: 8.0),
      // color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          )
        ],
      ),

      child: Row(
        children: [
          // صورة المنتج
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.09),
                  blurRadius: 10,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item.image!,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // تفاصيل المنتج
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.title[currentLanguage]!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '${MTexts.price.tr}: ${item.price}${isAr ? 'EGP' : '\$'}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(width: 16),
                    item.weight.isNotEmpty
                        ? Text('weight'.tr + ': ${item.weight}',
                            style: Theme.of(context).textTheme.bodyLarge)
                        : item.selectedVariation!.isNotEmpty
                            ? Text('size'.tr + ': ${item.size}',
                                style: Theme.of(context).textTheme.bodyLarge)
                            : const Text(''),
                  ],
                ),
                item.productType != ProductType.weight.toString()
                    ?
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
                            onPressed: () =>
                                cartController.removeOneFromCart(item),
                            icon: const Icon(Icons.remove_circle_outline),
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      )
                    //زر التحكم في الوزن
                    : IconButton(
                        onPressed: () async {
                          final weightController =
                              Get.find<WeightCustomizationController>();

                          final newWeight = await weightController.openDialog(
                              item.stock, item.weight);

                          if (newWeight != null) {
                            item.weight = newWeight;

                            await cartController
                                .updatePriceForWeightProduct(item.productId);
                          }
                        },
                        icon: const Icon(Iconsax.edit),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
