import 'package:cake_and_smile/features/shop/models/product_model.dart';


import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../shared/widgets/text/product_titel_text.dart';
import '../../../../shared/widgets/text/section_heading.dart';

import '../../../../utils/device/device_utility.dart';
import 'widgets/bottom_add_to_card.dart';
import 'widgets/product_attribute.dart';
import 'widgets/product_detail_sliver_app_bar.dart';
import 'widgets/product_pricing.dart';
import 'widgets/product_tags.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bool isAr = MDeviceUtils.isArabic();

    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: MBottomAddToCard(product: product),
        body: CustomScrollView(
          slivers: [
            //Image
            ProductDetailSliverAppBar(
                screenHeight: screenHeight, product: product, isAr: isAr),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //==== Tags ====//
                    ProductTags(product: product),

                    const SizedBox(height: MSizes.spaceBtwItems / 1.5),
                    //==== Price ====//
                    ProductPricing(product: product),

                    const SizedBox(height: MSizes.spaceBtwItems / 1.5),
                    //==== Stock ====//
                    Row(
                      children: [
                        MProductTitelText(titel: '${MTexts.stock.tr}: '),
                        const SizedBox(width: MSizes.sm),
                        Text(product.stock.toString(),
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                    const SizedBox(height: MSizes.spaceBtwItems / 1.5),
                    //==== Attributes ====//
                    // Text(product.productType),

                    if (product.productAttributes != null)
                      ProductAttributes(product: product),
                    const SizedBox(height: MSizes.spaceBtwItems / 1.5),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text(MTexts.checkout.tr)),
                    ),
                    const SizedBox(height: MSizes.spaceBtwItems / 1.5),
                    //================== Description ==================//
                    Text(
                      MTexts.description.tr,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ReadMoreText(
                      isAr
                          ? product.description['ar']!
                          : product.description['en']!,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: MSizes.spaceBtwItems),
                    //================== Reviews ==================//
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MSectionHeading(
                            titel: '${MTexts.reviews.tr} (999)',
                            showButtonText: false),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                                Icons.keyboard_arrow_right_outlined,
                                size: 30))
                      ],
                    ),
                    const SizedBox(height: MSizes.spaceBtwSections),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

//

// weight_customization_controller.dart


