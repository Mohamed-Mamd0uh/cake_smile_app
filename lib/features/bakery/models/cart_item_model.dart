class CartItemModel {
  String productId;
  String productType;
  String title;
  String? image;
  String variationId;
  Map<dynamic, dynamic>? selectedVariation;
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
      this.title = '',
      this.price = 0.0,
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
      'SelectedVariation': selectedVariation,
      'Title': title,
      'Image': image,
      'Price': price,
      'Priceforweight': priceforweight,
      'Weight': weight,
      'Quantity': quantity,
      'Stock': stock,
    };
  }

  // Create a CartItem from a JSON Map
  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      productId: map['productId'],
      productType: map['productType'],
      title: map['Title'],
      price: map['Price'].toDouble(),
      image: map['Image'],
      quantity: map['Quantity'],
      variationId: map['VariationId'],
      selectedVariation: map['SelectedVariation'] != null
          ? Map<String, String>.from(map['SelectedVariation'])
          : null,
      stock: map['Stock'],
    ); // CartItemModel
  }

  // Create a copy of the CartItemModel with optional field modifications
  CartItemModel copyWith({
    String? productId,
    String? productType,
    String? title,
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
