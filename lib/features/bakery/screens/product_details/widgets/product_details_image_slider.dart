import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class ProductDetailsImageSlider extends StatelessWidget {
  const ProductDetailsImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(16), // تحديد زوايا مدورة للجزء السفلي
        ),
        child: Image.asset(product.imageUrl, fit: BoxFit.cover));
  }
}