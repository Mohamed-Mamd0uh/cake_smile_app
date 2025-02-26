import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/dummy_data/dummy_data.dart';
import '../all_products/all_products.dart';

class AllCategory extends StatelessWidget {
  const AllCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = categoriesDummyData;
    // Get.put(ProductDetailController(products[0]));
    return Scaffold(
      appBar: AppBar(
        title: Text('فئات الحلويات'),
      ),
      // body: Center(
      //   child: ElevatedButton(
      //       onPressed: () {
      //         // Get.to(() => ProductPage());
      //         // Get.toNamed('/product', arguments: products[0]);
      //       },
      //       child: Text('Go to Product Details')),
      // ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            name: categories[index].name,
            image: categories[index].image,
            description: categories[index].description,
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  final String image;
  final String description;

  const CategoryCard(
      {super.key,
      required this.name,
      required this.image,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => AllProductsScreen(category: name));
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
