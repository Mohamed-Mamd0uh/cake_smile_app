import 'package:cake_and_smile/features/shop/controllers/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoritesController());
    return Positioned(
      top: 8,
      right: 8,
      child: CircleAvatar(
        backgroundColor: MColors.white.withOpacity(0.5),
        child: IconButton(
          onPressed: () {
            controller.toggleFavorite(productId);
          },
          icon: Obx(
            () => Icon(
              controller.isFavorite(productId)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: MColors.primary,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
