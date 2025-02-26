import 'package:cake_and_smile/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/loader/loaders.dart';
import '../models/cart_item_model.dart';
import '../models/product_model.dart';
import 'variation_controller.dart';
import 'weight_customization_controller.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxString weight = ''.obs;

  RxInt productQuantityInCart = 0.obs;

  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final VariationController variationController = VariationController.instance;
  final WeightCustomizationController weightController =
      Get.put(WeightCustomizationController());

  //

  void addToCart(ProductModel product) {
    final CartItemModel seletedCartItem;
    int index;
    double weightInKilo = 0.0;
    // Weight Selected?
    if (product.productType == ProductType.weight.toString()) {
      weightInKilo =
          MHelperFunctions().convertTokilo(weightController.theweight.value);

      if (weight.value.isEmpty) {
        Mloaders.customToast(message: 'Select Weight');
        return;
      }
      if (product.stock < weightInKilo) {
        Mloaders.warningSnackBar(
            message: 'Selected product is out of stock.', title: 'Warning!');
        return;
      }

      seletedCartItem = convertToCartItem(product, 0, weight.value);
      index = cartItems.indexWhere(
          (cartItem) => cartItem.productId == seletedCartItem.productId);

      if (index >= 0) {
        cartItems[index].weight = weight.value;
      } else {
        cartItems.add(seletedCartItem);
      }
      updateCart();
      Mloaders.customToast(message: 'your product has been added to the cart');
    } else {
      if (productQuantityInCart.value < 1) {
        Mloaders.customToast(message: 'Select Quantity');
        return;
      }
      // Variation Selected?    <==============
      if (product.productType == ProductType.size.toString() &&
          variationController.selectedVariation.value.id.isEmpty) {
        Mloaders.customToast(message: 'Select Variation');
        return;
      }

      if (product.productType == ProductType.size.toString() &&
          variationController.selectedVariation.value.stock < 1) {
        Mloaders.warningSnackBar(
            message: 'Selected variation is out of stock.', title: 'Warning!');
        return;
      }

      seletedCartItem =
          convertToCartItem(product, productQuantityInCart.value, '');
      index = cartItems.indexWhere((cartItem) {
        return cartItem.productId == seletedCartItem.productId &&
            cartItem.variationId == seletedCartItem.variationId;
      });
      if (index >= 0) {
        cartItems[index].quantity += seletedCartItem.quantity;
      } else {
        cartItems.add(seletedCartItem);
      }
      updateCart();
      Mloaders.customToast(message: 'your product has been added to the cart');
    }
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);
    if (index >= 0) {
      cartItems[index].quantity -= 1;
    } else {
      cartItems.remove(item);
    }
    updateCart();
  }

  void removeFromCart(CartItemModel item) {
    cartItems.remove(item);
    updateCart();
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    // If product has no variations then calculate cartEntries and display total number.
    // Else make default entries to 0 and show cartEntries when variation is selected.
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      // Get selected Variation if any...
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value =
            getVariationQuantityInCart(product.id, variationId);
        print(
            ' productQuantityInCart *==========================>$productQuantityInCart');
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }

  CartItemModel convertToCartItem(
      ProductModel product, int quantity, String? weight) {
    double? pricebyWeight;

    if (product.productType == ProductType.single.toString()) {
      // Reset variation in case of single product type.
      variationController.resetSelectedAttributes();
    }

    if (product.productType == ProductType.weight.toString()) {
      pricebyWeight = weightController.getPriceByWeight(
          variationController.selectedAttributes['weight'] ?? '',
          product.price);
    }
    final isweight = product.productType == ProductType.weight.toString();
    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice! > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      stock: product.stock,
      productType: product.productType,
      title: product.name,
      price: (isweight ? pricebyWeight : price) ?? 0.0,
      priceforweight: isweight ? product.price : null,
      quantity: quantity,
      weight: weight ?? '',
      variationId: variation.id,
      image: product.thumbnail,
      selectedVariation: variationController.selectedAttributes,
    );
  }

  void updateCart() {
    updateCartTotals();
    cartItems.refresh();
    update(); // ←
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  void updateCartTotals() {
    double totalPrice = 0.0;
    int noOfItems = 0;
    for (var item in cartItems) {
      totalPrice += (item.price) * item.quantity.toDouble();
      if (item.productType == ProductType.weight.toString()) {
        totalPrice += item.price;
      }
      noOfItems += item.quantity;
    }

    noOfCartItems.value = noOfItems;
    totalCartPrice.value = totalPrice;
  }

  void updatePriceForWeightProduct(String productId) {
    double? pricebyWeight;
    final index = cartItems.indexWhere((item) => item.productId == productId);
    final currentWeight = weightController.theweight.value;

    if (index != -1) {
      pricebyWeight = weightController.getPriceByWeight(
          cartItems[index].weight, cartItems[index].priceforweight ?? 0.0);
      cartItems[index].price = pricebyWeight;
      cartItems[index].weight = currentWeight;
      updateCart();
    }
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
      (item) => item.productId == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );

    return foundItem.quantity;
  }

  @override
  void onClose() {
    Get.delete<WeightCustomizationController>();
    super.onClose();
  }
}
