import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/constants/text_strings.dart';
import 'package:cake_and_smile/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.title,
      required this.image,
      required this.subTitel,
      required this.onPressed});
  final String title, image, subTitel;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(MSizes.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(image, width: MHelperFunctions.screenWidth() * 0.6),

            ///
            const SizedBox(height: MSizes.spaceBtwSections),
            Text(title.tr,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center),

            const SizedBox(height: MSizes.spaceBtwItems),
            Text(subTitel.tr,
                style: Theme.of(context).textTheme.labelSmall,
                textAlign: TextAlign.center),

            const SizedBox(height: MSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: onPressed, child: const Text(MTexts.tContinue)),
            ),
          ],
        ),
      ),
    );
  }
}
