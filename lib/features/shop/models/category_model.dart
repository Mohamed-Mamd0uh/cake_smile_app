import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  Map<String, String> name;
  String image;
  String parenId;
  bool isFeatured;
  Map<String, String> description;
  CategoryModel({
    this.id = '',
    required this.name,
    this.image = '',
    this.isFeatured = false,
    this.parenId = '',
    required this.description,
  });
  static CategoryModel empty() => CategoryModel(
      id: '',
      name: {},
      image: '',
      isFeatured: false,
      parenId: '',
      description: {});

  //=========//

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'ParenId': parenId,
      'Description': description,
    };
  }
  //=========//

  factory CategoryModel.fromJson(json) {
    return CategoryModel(
      id: json['Id'] as String,
      name: json['Name'] as Map<String, String>,
      image: json['Image'] as String,
      isFeatured: json['IsFeatured'] as bool,
      parenId: json['ParenId'] as String,
      description: json['Description'] as Map<String, String>,
    );
  }

  factory CategoryModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CategoryModel(
      id: doc.id,
      name: Map<String, String>.from(data['name']),
      description: Map<String, String>.from(data['description']),
      image: data['image'],
      isFeatured: data['isFeatured'] ?? false,
    );
  }
}
