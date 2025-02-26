import 'package:cake_and_smile/features/bakery/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/widgets/text/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product_controller.dart';
import '../../../controllers/variation_controller.dart';
import '../../../controllers/weight_customization_controller.dart';
import '../../../models/products_variations_model.dart';
import '../product_details_screen.dart';

class ProductAttributes extends StatelessWidget {
  final ProductModel product;

  const ProductAttributes({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final productController = Get.put(ProductsController());
    final weightController = Get.put(WeightCustomizationController());
    final bool isWeightProduct =
        product.productType == ProductType.weight.toString();
    //ProductsController
    return Column(
      children: [
        MSectionHeading(
            titel: product.productAttributes!.name ?? '',
            showButtonText: false),
        const SizedBox(width: MSizes.spaceBtwItems / 2),
        //=====//

        Obx(
          () => Wrap(
            spacing: 8,
            children: product.productAttributes!.values!.map((e) {
              final isSelect = controller
                      .selectedAttributes[product.productAttributes!.name] ==
                  e;

              final available = isWeightProduct
                  ? controller.getAttributesAvailabilityweight(product.stock, e)
                  : controller
                      .getAttributesAvailabilityInVariation(
                          product.productVariations,
                          product.productAttributes!.name!)
                      .contains(e);

              return ChoiceChip(
                  backgroundColor: isSelect ? MColors.accent : MColors.grey,
                  label: Text(e),
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  selected:
                      // true,
                      isSelect,
                  onSelected: available
                      ? (selected) {
                          print(
                              '${product.productAttributes!.name}====================> $e===============> $selected');

                          if (selected) {
                            controller.onAttributeSelected(
                                product, product.productAttributes!.name!, e);
                            if (isWeightProduct) {
                              weightController.theweight.value = e;
                            }
                          } else {
                            controller.selectedAttributes
                                .remove(product.productAttributes!.name);
                          }
                        }
                      : null);
            }).toList(),
          ),
        ),
        if (product.productType == ProductType.weight.toString())
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: TextButton(
              onPressed: () async {
                // افتح واجهة لتخصيص الوزن
                await Get.put(WeightCustomizationController())
                    .openDialog(product.stock, '');
              },
              child: const Text(
                'تخصيص الوزن',
                style: TextStyle(
                  color: MColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/*

 */