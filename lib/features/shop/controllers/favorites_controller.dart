import 'package:cake_and_smile/features/shop/models/product_model.dart';
import 'package:get/get.dart';

import '../../../utils/dummy_data/dummy_data.dart';

class FavoritesController extends GetxController {
  final favorites = <String, bool>{}.obs;

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavorite(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
    } else {
      favorites.remove(productId);
    }
    update();
  }
  List<ProductModel> getFavoriteProducts() {
    final products = initializeDummyData();
    return products
        .where((product) => favorites.containsKey(product.id))
        .toList();
  }
}
