import 'package:cake_and_smile/data/repositories/product_repository.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/dummy_data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';
import '../home/widgets/product_card_vertical.dart';

class AllProductsScreen extends StatelessWidget {
  final String category;
  final String? tag;

  const AllProductsScreen({super.key, required this.category, this.tag});

  // تصفية المنتجات حسب الفئة
  List<ProductModel> getCategoryProducts() {
    return initializeDummyData()
        .where((product) => product.category == category)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductRepository());
    // List<ProductModel> categoryProducts = getCategoryProducts();

    return Scaffold(
      appBar: AppBar(
          // title: Text('Products in ${category.name}'),
          ),
      body: FutureBuilder(
        future: tag != null
            ? productController.getProductsByTag(tag!)
            : productController.getProductsByCategory(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No products found'));
          }
          if (snapshot.hasData) {
            final productsData = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // عدد الأعمدة
                crossAxisSpacing:
                    MSizes.gridViewSpacing, // المسافة الأفقية بين العناصر
                mainAxisSpacing:
                    MSizes.gridViewSpacing, // المسافة العمودية بين العناصر
                mainAxisExtent: 288,
                childAspectRatio: 0.75, // نسبة العرض إلى الارتفاع
              ),
              itemCount: productsData.length,
              itemBuilder: (context, index) {
          
                return ProductCardVertical(product: productsData[index]);
              },
            );
          }
          return const Center(
            child: Text('No products found'),
          );
        },
      ),
    );
  }
}
