import 'package:cake_and_smile/data/repositories/product_repository.dart';

import 'package:cake_and_smile/features/shop/screens/product_details/product_details_screen.dart';
import 'package:cake_and_smile/shared/images/rounded_image.dart';
import 'package:cake_and_smile/utils/constants/colors.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/constants/text_strings.dart';
import 'package:cake_and_smile/utils/dummy_data/dummy_data.dart';
import 'package:cake_and_smile/utils/helpers/helper_functions.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  CustomSearchDelegate();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final languageKey = MHelperFunctions().detectLanguage(query);
    final currentLocale = Get.locale!.languageCode;
    return FutureBuilder(
      future: ProductRepository().getAllProducts(),
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

        if (snapshot.hasData) {
          final products = snapshot.data!;
          final results = products
              .where((product) => product.name[languageKey]!.contains(query))
              .toList();
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  query = results[index].name[languageKey]!;
                  Get.to(() => ProductDetailsScreen(product: results[index]));
                  showResults(context);
                },
                child: SearchItem(
                    languageKey: currentLocale,
                    image: results[index].imageUrl,
                    name: results[index].name[currentLocale]!,
                    price: results[index].price,
                    stock: results[index].stock),
              );
            },
          );
        } else {
          return const Center(child: Text('No products found'));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final languageKey = MHelperFunctions().detectLanguage(query);
    final currentLocale = Get.locale!.languageCode;
    final suggestions = query.isEmpty
        ? []
        : initializeDummyData()
            .where((product) =>
                product.name[languageKey]!.toLowerCase().contains(query))
            .toList();

    return ListView.separated(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            query = suggestions[index].name[currentLocale]!;
            showResults(context);
          },
          child: SearchItem(
              languageKey: currentLocale,
              image: suggestions[index].imageUrl,
              name: suggestions[index].name[currentLocale]!,
              price: suggestions[index].price,
              stock: suggestions[index].stock),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 0);
      },
    );
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.stock,
      required this.languageKey});
  final String image;
  final String name;
  final double price;
  final double stock;
  final String languageKey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(MSizes.sm),
        decoration: BoxDecoration(
            color: MColors.white,
            borderRadius: BorderRadius.circular(MSizes.cardRadiusLg),
            boxShadow: [
              BoxShadow(
                color: MColors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ]),
        child: Row(
          children: [
            MRoundedImage(
                image: image, width: 100, height: 100, boxShadow: true),
            const SizedBox(width: MSizes.md),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(name, style: Theme.of(context).textTheme.headlineSmall),
                Row(
                  children: [
                    Text(
                        "${MTexts.price.tr}: ${languageKey == "ar" ? "EGP" : "\$"}${price.toString()}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: MSizes.sm),
                    Text("${MTexts.stock.tr}: $stock",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
