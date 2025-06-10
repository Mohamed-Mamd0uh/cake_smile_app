import 'package:flutter/material.dart';

import '../../../../../shared/widgets/buttons/custom_back_arrow_button.dart';
import '../../../models/product_model.dart';
import 'product_details_image_slider.dart';
import 'product_info_section.dart';

class ProductDetailSliverAppBar extends StatelessWidget {
  const ProductDetailSliverAppBar({
    super.key,
    required this.screenHeight,
    required this.product,
    required this.isAr,
  });

  final double screenHeight;
  final ProductModel product;
  final bool isAr;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: screenHeight * 0.5,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: ProductDetailsImageSlider(product: product),
      ),
      // leadingWidth: ,
      automaticallyImplyLeading: false,
      leading: !isAr
          ? Padding(
              padding: const EdgeInsets.only(
                  left: 14.0, top: 8, bottom: 7, right: 1),
              child: CustomBackArrowButton(isAr: isAr, size: 36),
            )
          : null,
      actions: isAr
          ? [
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: CustomBackArrowButton(isAr: isAr, size: 41),
              ),
            ]
          : null,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: ProductInfoSection(product: product),
      ),
    );
  }
}
