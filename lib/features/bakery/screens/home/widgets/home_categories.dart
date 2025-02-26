import 'package:cake_and_smile/features/bakery/screens/all_products/all_products.dart';
import 'package:cake_and_smile/shared/images/rounded_image.dart';
import 'package:cake_and_smile/shared/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/dummy_data/dummy_data.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/category_model.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModels> categories = categoriesDummyData;

    return SizedBox(
      height: 105,
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
                    Get.to(AllProductsScreen(category: categories[index].name));
                  },
                  child: MRoundedImage(
                    width: 80,
                    height: 80,
                    image: categories[index].image,
                  ),
                ),
                const SizedBox(height: MSizes.spaceBtwItems / 2),
                Text(
                  categories[index].name,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
