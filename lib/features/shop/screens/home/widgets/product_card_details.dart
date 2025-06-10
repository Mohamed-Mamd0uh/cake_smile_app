import 'package:cake_and_smile/features/shop/controllers/product_controller.dart';
import 'package:cake_and_smile/shared/widgets/text/product_price_text.dart';
import 'package:cake_and_smile/utils/constants/enums.dart';
import 'package:cake_and_smile/utils/device/device_utility.dart';
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
    final controller = ProductsController.instance;
    final currentLocale = Get.locale!.languageCode;

    return Padding(
      padding: const EdgeInsets.all(MSizes.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              product.name[currentLocale]!,
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          //description

          Expanded(
            flex: 1,
            child: Text(
              product.description[currentLocale]!,
              style: Theme.of(context).textTheme.labelMedium,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),

          Row(
            children: [
              if (product.productType == ProductType.single.toString() ||
                  product.productType == ProductType.weight.toString() &&
                      product.salePrice! > 0)
                Text("${product.price.toString()} ",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(decoration: TextDecoration.lineThrough)),
              if (product.productType == ProductType.single.toString() ||
                  product.productType == ProductType.weight.toString() &&
                      product.salePrice! > 0)
                Text("- ", style: Theme.of(context).textTheme.titleLarge),
              MProductPriceText(
                price: controller.getProductPrice(product),
                currencySign: MDeviceUtils.isArabic() ? 'EGP' : '\$',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
