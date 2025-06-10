import 'package:flutter/material.dart';
import '../../../../../shared/widgets/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product_controller.dart';
import '../../../models/product_model.dart';
import 'favorite_button.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.product,
    // required this.productController,
  });

  final ProductModel product;
  // final ProductController productController;

  @override
  Widget build(BuildContext context) {
    final productcontroller = ProductsController.instance;
    final salePercentage = productcontroller.calculateSalePercentage(
        product.price, product.salePrice!);
    return Container(
      height: 180,
      // width: 180,
      decoration: BoxDecoration(
        color: MColors.light,
        borderRadius: const BorderRadius.all(
          Radius.circular(MSizes.productImageRadius),
        ),
        image: DecorationImage(
          image: AssetImage(product.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          if (salePercentage != null)
            Positioned(
              left: 6,
              top: 12,
              child: MRoundedContainer(
                borderRadius: MSizes.sm,
                backgroundColor: MColors.secondary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(
                    horizontal: MSizes.sm, vertical: MSizes.xs),
                child: Text(
                  '$salePercentage%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: MColors.black),
                ),
              ),
            ),
          FavoriteButton(
            productId: product.id,
            // productController: productController,
          ),
        ],
      ),
    );
  }
}
