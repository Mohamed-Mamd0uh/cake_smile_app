import 'package:cake_and_smile/shared/widgets/appbar/appbar.dart';
import 'package:cake_and_smile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'features/bakery/models/products_attributes_model.dart';
import 'features/bakery/models/products_variations_model.dart';
import 'utils/device/device_utility.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String categoryId;
  final String productType;
  final String thumbnail;
  final List<String> images;
  final List<String> tags;
  bool? isFeatured;
  final int stock;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.categoryId,
    required this.tags,
    required this.stock,
    required this.productType,
    required this.thumbnail,
    this.isFeatured,
    this.productAttributes,
    this.productVariations,
  });
}

List<Product> initializeDummyData() {
  return [
    // Cake Products
    Product(
      productType: '',
      stock: 2,
      id: 'cake_001',
      title: 'الكيكة الفانيليا الكلاسيكية',
      description: 'كيكة فانيليا طرية وناعمة، مغطاة بكريمة زبدة لذيذة وخفيفة.',
      price: 25.00,
      categoryId: 'cakes_category',
      images: ['assets/images/products/cakes/vanilla_cake.jpg'],
      tags: ['كيكات', 'فانيليا', 'صحي'],
      thumbnail: '',
      productAttributes: [
        ProductAttributeModel(
          name: 'Size',
          values: ['Large', 'Medium', 'Small'],
        )
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 2,
          price: 10,
          salePrice: 8,
          attributeValues: {'Size': 'small'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 2,
          price: 10,
          salePrice: 8,
          attributeValues: {'Size': 'medium'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 2,
          price: 10,
          salePrice: 8,
          attributeValues: {'Size': 'large'},
        ),
      ],
    ),
    Product(
      id: 'cake_002',
      title: 'كيكة الشوكولاتة الكلاسيكية',
      description: 'كيكة شوكولاتة غنية وطرية، مغطاة بصوص الشوكولاتة الساخن.',
      price: 30.00,
      categoryId: 'cakes_category',
      images: ['assets/images/products/cakes/chocolate_cake.jpg'],
      tags: ['كيكات', 'شوكولاتة', 'صحي'],
      stock: 2,
      productType: '',
      thumbnail: '',
      productAttributes: [
        ProductAttributeModel(
          name: 'Size',
          values: ['Large', 'Medium', 'Small'],
        )
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 2,
          price: 10,
          salePrice: 8,
          attributeValues: {'Size': 'small'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 2,
          price: 10,
          salePrice: 8,
          attributeValues: {'Size': 'medium'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 2,
          price: 10,
          salePrice: 8,
          attributeValues: {'Size': 'large'},
        ),
      ],
    ),
  ];
}

class ProductPage extends StatelessWidget {
  @override
  ProductPage({super.key});

  final Product product = initializeDummyData().first;

  final String selectedWeight = '250g';

  final List<String> weights = ['250g', '500g', '1KG'];

  @override
  Widget build(BuildContext context) {
    final bool isAr = MDeviceUtils.isArabic();
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: screenHeight * 0.5,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(16), // تحديد زوايا مدورة للجزء السفلي
                ),
                child: Image.asset(product.images.first, fit: BoxFit.cover)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Container(
                width: 36,
                height: 36,
                // alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  color: MColors.light.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(isAr ? Icons.chevron_right : Icons.chevron_left,
                      color: MColors.black, size: 35),
                  onPressed: () {},
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(200),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: MColors.darkGrey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title,
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: MColors.white)),
                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          SizedBox(width: 4),
                          Text(
                            '4.5',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border,
                              color: Colors.black),
                          onPressed: () {},
                        ),
                      ),
                      const Text('price',
                          style: TextStyle(color: Colors.white)),
                      Text(
                        '\$ ${product.price}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.tags.join(', '),
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                // _buildSpecialNotes(),
                // _buildQuantitySelector(),
                _buildActionButtons(),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget _buildProductDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product.description,
          style: TextStyle(
            color: Colors.grey[600],
            height: 1.5,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('read more'),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Add to Cart'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Buy Now'),
          ),
        ),
      ],
    );
  }
}
/*
معلومات اضافية :
استخدام GETX ,
هذا هو موديل المنتج:
class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final List<String> images;
  final String categoryId;
  final List<String> tags;
  bool? isFeatured;
  final int stock;
  final String productType;
  final String thumbnail;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  class ProductAttributeModel {
  String? name;
  final List<String>? values;
}

class ProductVariationModel {
  final String id;
  final int stock;
  final double price;
  final double? salePrice;
  final Map<String, String>? attributeValues;


}
قوم بتعديل الموديل  اذا احتاج الي ذالك
وهذه بعض المنتجات: Product(
      productType: '',
      stock: 2,
      id: 'cake_001',
      title: 'الكيكة الفانيليا الكلاسيكية',
      description: 'كيكة فانيليا طرية وناعمة، مغطاة بكريمة زبدة لذيذة وخفيفة.',
      price: 25.00,
      categoryId: 'cakes_category',
      images: ['assets/images/products/cakes/vanilla_cake.jpg'],
      tags: ['كيكات', 'فانيليا', 'صحي'],
      thumbnail: '',
      productAttributes: [
        ProductAttributeModel(
          name: 'Size',
          values: ['Large', 'Medium', 'Small'],
        )
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 2,
          price: 10,
          salePrice: 8,
          attributeValues: {'Size': 'small'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 2,
          price: 10,
          salePrice: 8,
          attributeValues: {'Size': 'medium'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 2,
          price: 10,
          salePrice: 8,
          attributeValues: {'Size': 'large'},
        ),
      ],
    ),

 */