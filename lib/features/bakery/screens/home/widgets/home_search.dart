import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: MSizes.sm),
      decoration: BoxDecoration(
        color: dark ? MColors.softGrey : MColors.primary,
        borderRadius: BorderRadius.circular(MSizes.cardRadiusLg),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Iconsax.search_normal),
          hintText: 'homeSearchHint'.tr,
          hintStyle: const TextStyle(
            color: MColors.black,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
