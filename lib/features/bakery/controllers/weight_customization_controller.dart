import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/loader/loaders.dart';
import 'variation_controller.dart';

class WeightCustomizationController extends GetxController {
  static WeightCustomizationController instance = Get.find();
  final selectedWeight = 0.0.obs;
  final RxString _selectedUnit = 'kg'.obs;
  final theweight = ''.obs;

  final TextEditingController weightController = TextEditingController();

  // double get selectedWeight => selectedWeight.value;
  String get selectedUnit => _selectedUnit.value;

  void changeUnit(String newUnit) {
    _selectedUnit.value = newUnit;
  }

  void validateAndSave(double stock) {
    final enteredValue = weightController.text.trim();

    if (enteredValue.isEmpty) {
      Get.snackbar('خطأ', 'يرجى إدخال قيمة الوزن',
          snackPosition: SnackPosition.TOP,
          backgroundColor: MColors.error.withOpacity(0.7));
      return;
    }

    final parsedValue = double.tryParse(enteredValue);
    if (parsedValue == null || parsedValue <= 0) {
      Get.snackbar('خطأ', 'قيمة الوزن غير صالحة',
          snackPosition: SnackPosition.TOP,
          backgroundColor: MColors.error.withOpacity(0.7),
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(10));
      return;
    }

    double weightInKg =
        _selectedUnit.value == 'kg' ? parsedValue : parsedValue / 1000;

    if (weightInKg > stock) {
      Mloaders.errorSnackBar(
          message: ' الكمية المطلوبة غير متوفرة',
          title: 'خطأ',
          snackPosition: SnackPosition.TOP);
      // Get.snackbar(
      //   '$enteredValue ${_selectedUnit.value}',
      //   ' الكمية المطلوبة غير متوفرة',
      //   snackPosition: SnackPosition.TOP,
      //   backgroundColor: MColors.error.withOpacity(0.7),
      //   colorText: MColors.white,
      // );

      return;
    }
    selectedUnit == 'g'
        ? theweight.value = ('${enteredValue}g')
        : theweight.value = ('${weightInKg}kg');
    print('=================**=========>$theweight<=====**================');
  }
  // void validateAndSave(double stock) {
  //   final variationController = Get.put(VariationController());
  //   final enteredValue = weightController.text.trim();
  //   final parsedValue = double.tryParse(enteredValue);

  //   if (parsedValue == null || parsedValue <= 0) {
  //     Get.snackbar('خطأ', 'يرجى إدخال قيمة صالحة');
  //     return;
  //   }

  //   if (_selectedUnit.value == 'g' && parsedValue >= 1000) {
  //     selectedWeight.value = parsedValue / 1000;
  //     _selectedUnit.value = 'kg';
  //   } else {
  //     selectedWeight.value = parsedValue;
  //   }

  //   if (selectedWeight.value > stock && _selectedUnit.value == 'kg') {
  //     Get.snackbar('${selectedWeight.value} ${_selectedUnit.value}خطأ',
  //         'الكمية المطلوبة غير متوفرة');
  //     return;
  //   }
  //   final weight = '${selectedWeight.value} ${_selectedUnit.value}';
  //   // إرسال القيمة إلى الـ Parent Controller
  //   print('==========================>$weight<=====================');
  //   variationController.selectAttribute('weight', weight);

  //   Get.back(); // إغلاق الـ Dialog
  // }
  Future<String?> openDialog(double stock, String currentWeight) async {
    // تهيئة القيمة الحالية من العنصر في السلة
    if (currentWeight.isNotEmpty) {
      final parts = currentWeight.split(' ');
      if (parts.length == 2) {
        weightController.text = parts[0];
        _selectedUnit.value = parts[1];
      }
    } else {
      weightController.clear();
      _selectedUnit.value = 'kg';
    }

    bool isValid = false;

    await Get.dialog(
      AlertDialog(
        title: const Text('تخصيص الوزن'),
        content: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('أدخل الوزن المطلوب:'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: weightController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        labelText: 'الوزن',
                        border: OutlineInputBorder(),
                        hintText: 'مثال: 2.5',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: _selectedUnit.value,
                    items: const [
                      DropdownMenuItem(
                        value: 'kg',
                        child: Text('كجم'),
                      ),
                      DropdownMenuItem(
                        value: 'g',
                        child: Text('جرام'),
                      ),
                    ],
                    onChanged: (value) => changeUnit(value!),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(), // إرجاع null عند الإلغاء
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              validateAndSave(stock);
              if (theweight.value.isNotEmpty) {
                isValid = true;
                Get.back(); // سيتم التعامل مع القيمة في Future
              }
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );

    return isValid ? '$theweight' : null;
  }
// في weight_customization_controller.dart
  // Future openDialog(double stock) async {
  //   Get.dialog(
  //     AlertDialog(
  //       title: const Text('تخصيص الوزن'),
  //       content: Obx(
  //         () => Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             const Text('أدخل الوزن المطلوب:'),
  //             const SizedBox(height: 16),
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: TextFormField(
  //                     controller: weightController,
  //                     keyboardType:
  //                         const TextInputType.numberWithOptions(decimal: true),
  //                     decoration: const InputDecoration(
  //                       labelText: 'الوزن',
  //                       border: OutlineInputBorder(),
  //                       hintText: 'مثال: 2.5',
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(width: 8),
  //                 DropdownButton<String>(
  //                   value: selectedUnit,
  //                   items: const [
  //                     DropdownMenuItem(
  //                       value: 'kg',
  //                       child: Text('كجم'),
  //                     ),
  //                     DropdownMenuItem(
  //                       value: 'g',
  //                       child: Text('جرام'),
  //                     ),
  //                   ],
  //                   onChanged: (value) => changeUnit(value!),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: Get.back,
  //           child: const Text('إلغاء'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             validateAndSave(stock);

  //           },
  //           child: const Text('حفظ'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  double getPriceByWeight(String weight, double productPrice) {
    try {
      final cleanedWeight = weight.trim().toLowerCase();
      final parts = cleanedWeight.split(RegExp(r'(kg|g)'));

      if (parts.length < 2) return 0.0;

      final value = double.parse(parts[0].trim().replaceAll(',', '.'));

      // التحقق من عدم سلبية القيمة
      if (value <= 0) return 0.0;

      final unit = cleanedWeight.contains('kg') ? 'kg' : 'g';

      return (unit == 'kg' ? value : value / 1000) * productPrice;
    } catch (e) {
      return 0.0;
    }
  }

  @override
  void onClose() {
    weightController.dispose();
    super.onClose();
  }
}
