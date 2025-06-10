import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';
import 'product_card_vertical.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: MSizes.gridViewSpacing,
        crossAxisSpacing: MSizes.gridViewSpacing,
        mainAxisExtent: 288,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCardVertical(
          product: product,
          // productController: productController,
        );
      },
    );
  }
}
