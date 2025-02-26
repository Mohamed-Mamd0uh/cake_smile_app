import 'package:cake_and_smile/features/bakery/controllers/product_controller.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/dummy_data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';
import '../home/widgets/product_card_vertical.dart';

class AllProductsScreen extends StatelessWidget {
  final String category;

  const AllProductsScreen({super.key, required this.category});

  // تصفية المنتجات حسب الفئة
  List<ProductModel> getCategoryProducts() {
    return initializeDummyData()
        .where((product) => product.category == category)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // final ProductController productController = Get.put(ProductController());
    List<ProductModel> categoryProducts = getCategoryProducts();

    return Scaffold(
      appBar: AppBar(
          // title: Text('Products in ${category.name}'),
          ),
      body: GridView.builder(
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
        itemCount: categoryProducts.length,
        itemBuilder: (context, index) {
          // print('================>${categoryProducts.length}');
          return ProductCardVertical(product: categoryProducts[index]);
        },
      ),
    );
  }
}
