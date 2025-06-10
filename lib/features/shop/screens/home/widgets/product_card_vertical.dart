import 'package:cake_and_smile/features/shop/screens/product_details/product_details_screen.dart';
import 'package:cake_and_smile/utils/device/device_utility.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

import '../../../models/product_model.dart';
import '../../../controllers/variation_controller.dart';
import 'add_to_cart_button.dart';
import 'product_card_details.dart';
import 'product_image.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({
    super.key,
    required this.product,
    // required this.productController,
  });

  final ProductModel product;
  // final ProductController productController;

  @override
  Widget build(BuildContext context) {

    final bool isAr = MDeviceUtils.isArabic();
    Get.put(VariationController());

    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsScreen(product: product));
      },
      child: Container(
        decoration: BoxDecoration(
          color: MColors.softGrey,
          borderRadius: BorderRadius.circular(MSizes.productImageRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Thumbnail
            ProductImage(
              product: product,
              // productController: productController,
            ),
            // Details
            SizedBox(
              height: 108,
              width: double.infinity,
              child: Stack(
                children: [
                  ProductCardDetails(
                    product: product,
                  ),
                  Positioned(
                    bottom: 0,
                    right: isAr ? null : 0,
                    left: isAr ? 0 : null,
                    child: AddToCartButton(
                      product: product,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
