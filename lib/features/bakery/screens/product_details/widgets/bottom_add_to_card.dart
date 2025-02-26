import 'package:cake_and_smile/features/bakery/controllers/product_controller.dart';
import 'package:cake_and_smile/features/bakery/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../shared/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/cart_controller.dart';
import '../../../controllers/weight_customization_controller.dart';

class MBottomAddToCard extends StatelessWidget {
  const MBottomAddToCard({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final weightController = Get.put(WeightCustomizationController());
    controller.updateAlreadyAddedProductCount(product);
    // final dark = MHelperFunctions.isDarkMode(context);
    final unit = weightController.selectedUnit;
    Get.find<ProductsController>();
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: MSizes.defaultSpace,
        vertical: MSizes.defaultSpace / 2,
      ),
      decoration: const BoxDecoration(
          color: MColors.light,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MSizes.cardRadiusLg),
            topRight: Radius.circular(MSizes.cardRadiusLg),
          )),
      child: Obx(
        () {
          final weight = weightController.theweight.value;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              product.productType != ProductType.weight.toString()
                  ? Row(
                      children: [
                        MCircularIcon(
                          backgroundColor: MColors.primary,
                          icon: Iconsax.minus,
                          width: 50,
                          height: 50,
                          color: MColors.white,
                          onPressed: () {
                            controller.productQuantityInCart.value < 1
                                ? null
                                : controller.productQuantityInCart.value -= 1;
                          },
                        ),
                        const SizedBox(width: MSizes.spaceBtwItems),
                        Text(controller.productQuantityInCart.value.toString(),
                            style: Theme.of(context).textTheme.titleSmall),
                        const SizedBox(width: MSizes.spaceBtwItems),
                        MCircularIcon(
                          backgroundColor: MColors.accent,
                          icon: Iconsax.add,
                          width: 50,
                          height: 50,
                          color: MColors.white,
                          onPressed: () {
                            controller.productQuantityInCart.value += 1;
                          },
                        ),
                      ],
                    )
                  : SizedBox(
                      child: Text('${'Weight'}: $weight',
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
              ElevatedButton(
                  onPressed: () {
                    if (product.productType == ProductType.weight.toString() &&
                        controller.variationController.selectedAttributes
                            .isNotEmpty) {
                      controller.weight.value = weight.toString();
                      controller.addToCart(product);
                    } else {
                      print(
                          '==========><===========><===========>5<===========><===========><==========');
                      controller.addToCart(product);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(MSizes.md),
                    backgroundColor: MColors.accent,
                    // side: const BorderSide(color: MColors.black),
                  ),
                  child: const Text('Add to card'))
            ],
          );
        },
      ),
    );
  }
}
