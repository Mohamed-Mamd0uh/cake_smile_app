
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';


class ProductCardDetails extends StatelessWidget {
  const ProductCardDetails({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MSizes.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name.tr,
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '${product.price} ريال',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: MSizes.spaceBtwItems / 2),
        ],
      ),
    );
  }
}
