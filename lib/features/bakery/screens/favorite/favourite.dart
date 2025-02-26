import 'package:cake_and_smile/features/bakery/controllers/favorites_controller.dart';
import 'package:cake_and_smile/features/bakery/screens/home/widgets/product_grid.dart';
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
        title: const Text('المفضلة'),
      ),
      body: Obx(() => controller.favorites.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.heart, size: 64, color: MColors.primary),
                  SizedBox(height: 16),
                  Text('لا توجد منتجات في المفضلة'),
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
