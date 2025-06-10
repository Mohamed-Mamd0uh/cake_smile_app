
import 'package:cake_and_smile/utils/constants/image_strings.dart';


import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = MHelperFunctions.isDarkMode(context);

    return SliverAppBar(
      floating: true,
      centerTitle: true,
      elevation: 0,
      expandedHeight: 50,
      title: Image.asset(
        MImages.lightAppLogo,
        width: 120,
        height: 35,
        fit: BoxFit.cover,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.shopping_bag),
        ),
        IconButton(
          onPressed: () {
            // List<ProductModel> products = initializeDummyData();
            // // List<CategoryModel> categories = categoriesDummyData;
            // final data = FirebaseFirestore.instance;
            // for (var product in products) {
            //   data.collection('Products').doc(product.id).set(product.toJson());
            // }
            // for (var category in categories) {
            //   data
            //       .collection('Categories')
            //       .doc(category.id)
            //       .set(category.toJson());
            // }
          },
          icon: const Icon(Iconsax.notification),
        ),
      ],
    );
  }
}
