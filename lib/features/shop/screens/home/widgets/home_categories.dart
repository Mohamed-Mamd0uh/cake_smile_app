import 'package:cake_and_smile/features/shop/screens/all_products/all_products.dart';
import 'package:cake_and_smile/shared/images/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/dummy_data/dummy_data.dart';
import '../../../models/category_model.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = categoriesDummyData;
    final currentLocale = Get.locale!.languageCode;

    return SizedBox(
      height: 107,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: MSizes.spaceBtwItems),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(AllProductsScreen(category: categories[index].id));
                  },
                  child: MRoundedImage(
                    width: 80,
                    height: 80,
                    image: categories[index].image,
                  ),
                ),
                const SizedBox(height: MSizes.spaceBtwItems / 2),
                Text(
                  categories[index].name[currentLocale]!,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
