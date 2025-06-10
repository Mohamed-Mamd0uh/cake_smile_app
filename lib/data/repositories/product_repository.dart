import 'package:cake_and_smile/features/shop/models/product_model.dart';

import 'package:cake_and_smile/utils/device/device_utility.dart';
import 'package:cake_and_smile/utils/exceptions/firebase_exceptions.dart';
import 'package:cake_and_smile/utils/exceptions/format_exceptions.dart';
import 'package:cake_and_smile/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  final bool isAr = MDeviceUtils.isArabic();
  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getProductsByCategory(String category) async {
    try {
      final result = await _db
          .collection('Products')
          .where('category', isEqualTo: category)
          .get();
      return result.docs.map((e) => ProductModel.fromJson(e)).toList();
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code);
    } catch (e) {
      throw 'Something went wrong while fetching Products.';
    }
  }

  Future<List<ProductModel>> getProductsByTag(String tag) async {
    try {
      final query = isAr
          ? _db.collection('Products').where('tags.ar', arrayContains: tag)
          : _db.collection("Products").where("tags.en", arrayContains: tag);
      final result = await query.get();

      return result.docs.map((e) => ProductModel.fromJson(e.data())).toList();
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code);
    } catch (e) {
      throw 'Something went wrong while fetching Products. ${e.toString()}';
    }
  }

Future<List<ProductModel>> getAllProducts() async {
  try {
    final result = await _db.collection('Products').get();
    return result.docs.map((e) => ProductModel.fromJson(e)).toList();
  } on FirebaseException catch (e) {
    throw MFirebaseException(e.code);
  } on FormatException catch (_) {
    throw const MFormatException();
  } on PlatformException catch (e) {
    throw MPlatformException(e.code);
  } catch (e) {
    throw 'Something went wrong while fetching Products. ${e.toString()}';
  }
}
}
