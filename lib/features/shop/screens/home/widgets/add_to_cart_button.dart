import 'package:cake_and_smile/features/shop/screens/product_details/product_details_screen.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../controllers/cart_controller.dart';
import '../../../models/product_model.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final bool isAr = MDeviceUtils.isArabic();
    return Container(
      width: MSizes.iconLg * 1.2,
      height: MSizes.iconLg * 1.2,
      decoration: BoxDecoration(
        color: MColors.primary,
        borderRadius: isAr
            ? const BorderRadius.only(
                topRight: Radius.circular(10), bottomLeft: Radius.circular(10))
            : const BorderRadius.only(
                bottomRight: Radius.circular(10), topLeft: Radius.circular(10)),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          if (product.productType == ProductType.single.toString()) {
            cartController.addToCart(product);
          } else {
            Get.to(() => ProductDetailsScreen(product: product));
          }
      
          // Get.snackbar(
          //   'تم الإضافة للسلة',
          //   'تم إضافة ${product.name} للسلة',
          //   snackPosition: SnackPosition.BOTTOM,
          //   backgroundColor: MColors.primary.withOpacity(0.1),
          //   colorText: MColors.primary,
          //   duration: const Duration(seconds: 2),
          // );
        },
        icon: const Icon(
          Icons.add,
          color: MColors.white,
          size: 20,
        ),
      ),
    );
  }
}
