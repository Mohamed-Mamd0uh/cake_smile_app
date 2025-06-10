import 'package:cake_and_smile/utils/constants/enums.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';
import '../../../utils/dummy_data/dummy_data.dart';

class ProductsController extends GetxController {
  static ProductsController get instance => Get.find();
  // Define products list
  final RxList<ProductModel> _products = <ProductModel>[].obs;

  // Getter for products
  List<ProductModel> get products => _products;

  @override
  void onInit() {
    super.onInit();
    // Initialize products with dummy data
    _products.assignAll(initializeDummyData());
  }

  void toggleFavorite(ProductModel product) {
    final index = _products.indexOf(product);
    if (index != -1) {
      final updatedProduct = product.copyWith(
        isFavorite: !product.isFavorite,
      );
      _products[index] = updatedProduct;
      _products.refresh();
    }
  }

  List<ProductModel> get favoriteProducts =>
      _products.where((p) => p.isFavorite).toList();

  List<ProductModel> getProductsByCategory(String category) {
    return _products.where((p) => p.category == category).toList();
  }

  String? calculateSalePercentage(double originalPrice, double salePrice) {
    if (salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductPrice(ProductModel product) {
    double smallPrice = double.infinity;
    double largePrice = 0.0;

    if (product.productType == ProductType.single.toString() ||
        product.productType == ProductType.weight.toString()) {
      return (product.salePrice! > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var variations in product.productVariations!) {
        double price = variations.salePrice > 0.0
            ? variations.salePrice
            : variations.price;

        if (price < smallPrice) {
          smallPrice = price;
        }
        if (price > largePrice) {
          largePrice = price;
        }
      }
    }
    if (smallPrice.isEqual(largePrice)) {
      return largePrice.toString();
    } else {
      return ('$smallPrice - $largePrice');
    }
  }
}
