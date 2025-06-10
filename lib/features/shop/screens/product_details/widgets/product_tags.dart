import 'package:cake_and_smile/features/shop/screens/all_products/all_products.dart';
import 'package:cake_and_smile/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/widgets/containers/rounded_container.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';

class ProductTags extends StatelessWidget {
  const ProductTags({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bool isAr = MDeviceUtils.isArabic();
    return Wrap(
      spacing: 8.0, // المسافة بين العناصر
      children: product.tags![isAr ? 'ar' : 'en']!.map((tag) {
        return GestureDetector(
            onTap: () {
              // يمكنك إضافة أي عمل تريده عند النقر على العلامة
             Get.to(() => AllProductsScreen( category:'', tag: tag));
            },
            child: MRoundedContainer(
              borderRadius: MSizes.sm,
              padding: const EdgeInsets.symmetric(
                  horizontal: MSizes.sm, vertical: MSizes.xs),
              child: Text(tag),
            ));
      }).toList(),
    );
  }
}