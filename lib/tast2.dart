import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'features/bakery/controllers/product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.product.title),
        actions: [
          Obx(() => IconButton(
                icon: Icon(
                  controller.isFavorited.value
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: controller.toggleFavorite,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImages(),
            _buildProductDetails(),
            _buildVariationSelector(),
            _buildSpecialNotes(),
            _buildQuantitySelector(),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImages() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: PageView.builder(
        itemCount: controller.product.images.length,
        itemBuilder: (context, index) => Image.asset(
          controller.product.images[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${controller.currentPrice} ريال',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              RatingBarIndicator(
                rating: 4.5, // يمكن إضافته كمعلومة في الموديل
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20.0,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            controller.product.description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Obx(() => Text(
                'الكمية المتاحة: ${controller.availableStock}',
                style: TextStyle(
                  color:
                      controller.availableStock < 5 ? Colors.red : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildVariationSelector() {
    if (controller.product.productAttributes == null) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var attribute in controller.product.productAttributes!)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('اختر ${attribute.name}:',
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: attribute.values!.map((value) {
                    final variation = controller.product.productVariations!
                        .firstWhere(
                            (v) => v.attributeValues[attribute.name] == value);

                    return Obx(() => ChoiceChip(
                          label: Text(value),
                          selected:
                              controller.selectedVariation.value == variation,
                          onSelected: (selected) =>
                              controller.selectVariation(variation),
                          selectedColor: Colors.orange.withOpacity(0.3),
                        ));
                  }).toList(),
                ),
                const SizedBox(height: 16),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSpecialNotes() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: (value) => controller.specialNotes.value = value,
        decoration: const InputDecoration(
          labelText: 'ملاحظات خاصة (مثال: كتابة اسم على الكيك)',
          border: OutlineInputBorder(),
        ),
        maxLines: 3,
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Text('الكمية:', style: TextStyle(fontSize: 16)),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: controller.decrementQuantity,
          ),
          Obx(() => Text(
                controller.quantity.value.toString(),
                style: const TextStyle(fontSize: 18),
              )),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: controller.incrementQuantity,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.shopping_cart),
              label: const Text('أضف إلى العربة'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.credit_card),
              label: const Text('اشتري الآن'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
