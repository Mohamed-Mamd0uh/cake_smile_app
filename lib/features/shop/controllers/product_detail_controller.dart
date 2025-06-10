
// import 'package:get/get.dart';

// import '../models/products_variations_model.dart';

// class ProductDetailController extends GetxController {
//   // List<Product> products = initializeDummyData();
//   // final Product product;
//   RxBool isFavorited = false.obs;
//   Rx<ProductVariationModel?> selectedVariation =
//       Rx<ProductVariationModel?>(null);
//   RxInt quantity = 1.obs;
//   RxString specialNotes = ''.obs;

//   ProductDetailController(this.product);

//   void toggleFavorite() => isFavorited.toggle();

//   void selectVariation(ProductVariationModel variation) {
//     selectedVariation.value = variation;
//   }

//   void incrementQuantity() {
//     if (quantity.value < (selectedVariation.value?.stock ?? product.stock)) {
//       quantity.value++;
//     }
//   }

//   void decrementQuantity() {
//     if (quantity.value > 1) {
//       quantity.value--;
//     }
//   }

//   double get currentPrice {
//     return selectedVariation.value?.salePrice ??
//         selectedVariation.value?.price ??
//         product.price;
//   }

//   int get availableStock {
//     return selectedVariation.value?.stock ?? product.stock;
//   }
// }
