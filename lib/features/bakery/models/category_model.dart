

class CategoryModels {
  String id;
  String name;
  String image;
  String parenId;
  bool isFeatured;
  String description;
  CategoryModels({
    this.id = '',
    this.name = '',
    this.image = '',
    this.isFeatured = false,
    this.parenId = '',
    this.description = '',
  });
  static CategoryModels empty() =>
      CategoryModels(id: '', name: '', image: '', isFeatured: false);

  //=========//

  Map<String, dynamic> toMap() {
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

  // factory CategoryModels.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> docs) {
  //   if (docs.data() != null) {
  //     final data = docs.data()!;
  //     return CategoryModels(
  //       id: docs.id,
  //       name: data['Name'] ?? '',
  //       image: data['Image'] ?? '',
  //       isFeatured: data['IsFeatured'] ?? false,
  //       parenId: data['ParenId'] ?? '',
  //     );
  //   } else {
  //     return CategoryModels.empty();
  //   }
  // }

  CategoryModels fromMap(Map<String, dynamic>? map) {
    return CategoryModels(
      id: '1',
      name: map!['Name'],
      image: map['Image'],
      isFeatured: map['IsFeatured'],
      parenId: map['ParenId'],
      description: map['Description'],
    );
  }
}
