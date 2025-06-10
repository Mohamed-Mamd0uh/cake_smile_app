import 'package:cake_and_smile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product_controller.dart';
import '../all_category/all_category.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import '../../../../shared/widgets/coustom_header.dart';
import 'widgets/search/home_search.dart';
import 'widgets/product_grid.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductsController());

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // AppBar
            const HomeAppBar(),

            // Main Content
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(MSizes.defaultSpace),
                  child: Column(
                    children: [
                      // Search Bar
                      HomeSearch(),
                      const SizedBox(height: MSizes.spaceBtwSections),

                      // Categories Header
                      CoustomHeader(
                        title: MTexts.categories.tr,
                        button: true,
                        onTap: () {
                          Get.to(() => const AllCategory());
                        },
                      ),
                      const SizedBox(height: MSizes.spaceBtwItems),

                      // Categories
                      const HomeCategories(),
                      const SizedBox(height: MSizes.spaceBtwSections),

                      // Products Header
                      CoustomHeader(
                          title: MTexts.specialProducts.tr, onTap: () {}),

                      // const SizedBox(height: MSizes.spaceBtwItems / 2),

                      // Products Grid
                      ProductGrid(products: productController.products),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
