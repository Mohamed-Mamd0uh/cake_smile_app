class CartItemModel {
  String productId;
  String productType;
  String size;
  Map<dynamic, String> title;
  String? image;
  String variationId;
  Map? selectedVariation;
  double price;
  double? priceforweight;
  String weight;
  int quantity;
  double stock;

  CartItemModel(
      {required this.productId,
      required this.quantity,
      required this.productType,
      this.variationId = '',
      this.title = const {},
      this.price = 0.0,
      this.size = '',
      this.priceforweight,
      this.weight = '',
      this.image,
      this.selectedVariation,
      this.stock = 0});
  static CartItemModel empty() =>
      CartItemModel(productId: '', quantity: 0, productType: '');

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'VariationId': variationId,
      'productType': productType,
      'SelectedVariation': selectedVariation,
      'Title': title,
      'Image': image,
      'Price': price,
      'Priceforweight': priceforweight,
      'Weight': weight,
      'Quantity': quantity,
      'Stock': stock,
      'Size': size,
    };
  }

  // Create a CartItem from a JSON Map
  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      productId: map['productId'] ?? '',
      productType: map['productType'] ?? '',
      // title: map['Title'] ?? const {},
      title: map['Title'] != null
          ? (map['Title'] as Map).map(
              (key, value) => MapEntry(key, value.toString()),
            )
          : {},
      price: map['Price']?.toDouble() ?? 0.0,
      image: map['Image'] ?? '',
      quantity: map['Quantity'] ?? 0,
      variationId: map['VariationId'] ?? '',
      selectedVariation: map['SelectedVariation'] != null
          ? (map['SelectedVariation'] as Map).map(
              (key, value) => MapEntry(key.toString(), value.toString()),
            )
          : null,
      stock: map['Stock'] ?? 0,
      size: map['Size'] ?? '',
      priceforweight: map['Priceforweight']?.toDouble() ?? 0.0,
      weight: map['Weight'] ?? '',
    ); // CartItemModel
  }

  // Create a copy of the CartItemModel with optional field modifications
  CartItemModel copyWith({
    String? productId,
    String? productType,
    Map<String, String>? title,
    String? image,
    String? variationId,
    Map<dynamic, dynamic>? selectedVariation,
    double? price,
    int? quantity,
    double? stock,
  }) {
    return CartItemModel(
      productId: productId ?? this.productId,
      productType: productType ?? this.productType,
      title: title ?? this.title,
      image: image ?? this.image,
      variationId: variationId ?? this.variationId,
      selectedVariation: selectedVariation ?? this.selectedVariation,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      stock: stock ?? this.stock,
    );
  }
}
/*
 


 
 */