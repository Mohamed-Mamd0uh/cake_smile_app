import 'package:cake_and_smile/features/shop/screens/home/widgets/search/custom_search_delegate%20.dart';

import 'package:cake_and_smile/utils/constants/text_strings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/helpers/helper_functions.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
  
    return GestureDetector(
      onTap: () =>
          showSearch(context: context, delegate: CustomSearchDelegate()),
      child: Container(
          height: 40,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: MSizes.sm),
          decoration: BoxDecoration(
            color: dark ? MColors.softGrey : MColors.primary,
            borderRadius: BorderRadius.circular(MSizes.cardRadiusLg),
          ),
          child: Center(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search),
                const SizedBox(width: MSizes.spaceBtwItems),
                Text(
                  MTexts.homeSearchHint.tr,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          )),
    );
  }
}
/*

TextFormField(
        onFieldSubmitted: (value) {
          // showSearch(context: context, delegate: SearchController());
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Iconsax.search_normal),
          hintText: MTexts.homeSearchHint.tr,
          hintStyle: const TextStyle(
            color: MColors.black,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
 */