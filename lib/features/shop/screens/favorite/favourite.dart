import 'package:cake_and_smile/features/shop/controllers/favorites_controller.dart';
import 'package:cake_and_smile/features/shop/screens/home/widgets/product_grid.dart';
import 'package:cake_and_smile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoritesController());
    return Scaffold(
      appBar: AppBar(
        title: Text('favoritesTitle'.tr),
      ),
      body: Obx(() => controller.favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.heart, size: 64, color: MColors.primary),
                  SizedBox(height: 16),
                  Text('emptyFavorites'.tr),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductGrid(products: controller.getFavoriteProducts()),
              ),
            )),
    );
  }
}
