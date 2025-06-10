import 'package:cake_and_smile/features/personalization/models/address_model.dart';
import 'package:cake_and_smile/utils/exceptions/firebase_exceptions.dart';
import 'package:cake_and_smile/utils/exceptions/format_exceptions.dart';
import 'package:cake_and_smile/utils/exceptions/platform_exceptions.dart';
import 'package:cake_and_smile/utils/helpers/network_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'auth_repository.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final authRepository = Get.put(AuthRepository());
  final networkManager = Get.put(NetworkManager());
  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userId = authRepository.authUser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in few minutes.';
      }
      final result = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .get();
      return result.docs
          .map((documentSnapshot) =>
              AddressModel.fromDocumentSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Address Information. Try again later';
    }
  }

  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = authRepository.authUser!.uid;
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .doc(addressId)
          .update({'SelectedAddress': selected});
    } catch (e) {
      throw 'unable to update your address selection. Try again later';
    }
  }

  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = authRepository.authUser!.uid;
      final currentAddress = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .add(address.toMap());
      return currentAddress.id;
    } catch (e) {
      throw 'unable to update your address selection. Try again later';
    }
  }
}
