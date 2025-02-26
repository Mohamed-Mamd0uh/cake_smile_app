
import 'package:cake_and_smile/features/bakery/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/widgets/containers/rounded_container.dart';
import '../../../../../shared/widgets/text/product_price_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product_controller.dart';

class ProductPricing extends StatelessWidget {
  final ProductModel product;

  const ProductPricing({
    super.key,
      required this.product,
  });

  @override
  Widget build(BuildContext context) {
     final productcontroller = ProductsController.instance;
    final salePercentage = productcontroller.calculateSalePercentage(
        product.price, product.salePrice!);
    return Row(
      children: [
        MRoundedContainer(
          backgroundColor: MColors.secondary,
          borderRadius: MSizes.sm,
          padding: const EdgeInsets.symmetric(
              horizontal: MSizes.sm, vertical: MSizes.xs),
          child: Text('$salePercentage%',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: MColors.black)),
        ),
        const SizedBox(width: MSizes.spaceBtwItems),
        MProductPriceText(
          price: product.salePrice.toString(),
          lineThrough: true,
        ),
        const SizedBox(width: MSizes.spaceBtwItems),
        MProductPriceText(
          price: product.price.toString(),
          isLarge: true,
        ),
      ],
    );
  }
}
