import 'package:flutter/material.dart';

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
    return Wrap(
      spacing: 8.0, // المسافة بين العناصر
      children: product.tags!.map((tag) {
        return GestureDetector(
            onTap: () {
              // يمكنك إضافة أي عمل تريده عند النقر على العلامة
              print('تم النقر على: $tag');
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