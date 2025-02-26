import 'products_attributes_model.dart';
import 'products_variations_model.dart';

class ProductModel {
  String id;
  double stock;//<=========
  String name;
  String? description;
  String imageUrl;
  String productType;
  String thumbnail;
  double price;
  double? salePrice;
  List<String>? tags;
  String? category;
  bool isFavorite;
  ProductAttributeModel? productAttributes;
   List<ProductVariationModel>?productVariations; 
/*
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId; 
  List<String>? images; 
  String productType; 
  List<ProductAttributeModel>? productAttributes; 
  List<ProductVariationModel>?productVariations; 
 
 */
  ProductModel({
    required this.id,
    required this.name,
    this.description,
    required this.tags,
    required this.price,
    required this.imageUrl,
    this.category,
    required this.stock,
    required this.productType,
    required this.thumbnail,
    this.productAttributes,
    this.productVariations,
    required this.salePrice,
    this.isFavorite = false,
  });

  // Convert Product to Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'category': category,
      'isFavorite': isFavorite,
    };
  }

  // Create Product from Map
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      stock: json['stock'] as double,
      productType: json['productType'] as String,
      thumbnail: json['thumbnail'] as String,
      price: json['price'] as double,
      salePrice: json['salePrice'] as double,
      imageUrl: json['imageUrl'] as String,
      tags: List<String>.from(json['tags'] as List),
      category: json['category'] as String,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );
  }

  // Copy with method
  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? category,
    bool? isFavorite,
  
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      stock: stock,
      productType: productType,
      thumbnail: thumbnail,
      price: price ?? this.price,
      salePrice: salePrice,
      imageUrl: imageUrl ?? this.imageUrl,
      tags: tags,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
