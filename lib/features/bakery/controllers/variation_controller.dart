import 'package:get/get.dart';

import '../../../utils/helpers/helper_functions.dart';
import '../models/product_model.dart';
import '../models/products_variations_model.dart';
import 'cart_controller.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  RxString selectedWeight = '0.0'.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;
  MHelperFunctions helperfunctions = MHelperFunctions();
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    final selectedAtr = Map<String, dynamic>.from(selectedAttributes);
    //

    selectedAtr[attributeName] = attributeValue;
    selectedAttributes[attributeName] = attributeValue;
    //====
    if (product.productVariations != null &&
        product.productVariations!.isNotEmpty) {
      final selectedV = product.productVariations!.firstWhere(
          (variation) =>
              _isSameAttributeValues(variation.attributeValues, selectedAtr),
          orElse: () => ProductVariationModel.empty());

      selectedVariation.value = selectedV;
      if (selectedV.id.isNotEmpty) {
        print(
            '<===========><===========><===========><===========><===========><==========>');
        final controller = CartController.instance;
        controller.productQuantityInCart.value =
            controller.getVariationQuantityInCart(product.id, selectedV.id);
      }
    }

    // resetSelectedAttributes();
    //====
  }

  void selectAttribute(String attribute, String value) {
    selectedAttributes[attribute] = value;

    update();
  }

  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel>? variations, String attributeName) {
 
    final availableValue = (variations ?? [])
        .where((variation) =>
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        .map((e) => e.attributeValues[attributeName])
        .toSet();
    return availableValue;
  }

  bool getAttributesAvailabilityweight(double stock, String weight) {
    double numOfWeight = helperfunctions.convertTokilo(weight);
    return numOfWeight <= stock;
  }

  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    // If selectedAttributes contains 3 attributes and current variation contains 2 then return.
    // if (variationAttributes.length != selectedAttributes.length) return false;

    // If any of the attributes is different then return. e.g [Green, Large] x [Green, Small]
    for (final key in variationAttributes.keys) {
      // Attributes[Key] = Value which could be [Green, Small], Cotton] etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
