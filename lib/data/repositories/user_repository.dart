

import 'package:cake_and_smile/data/repositories/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';


import '../../features/authentication/models/user_model.dart';
import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/format_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _user = FirebaseFirestore.instance;
  final userId = Get.put(AuthRepository()).authUser!.uid;

  //====//

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _user.collection('Users').doc(user.id).set(user.toMap());
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong . try again';
    }
  }
  //====//

  Future<UserModel> fetchUserDetails() async {
    try {
      final doc = await _user
          .collection('Users')
          .doc(AuthRepository.instance.authUser!.uid)
          .get();
      if (doc.exists) {
        return UserModel.fromSnapshot(doc);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong . try again';
    }
  }

  //=======//
  Future<void> updateUserDetails(UserModel user) async {
    try {
      await _user.collection('Users').doc(user.id).update(user.toMap());
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong . try again';
    }
  }

  //======//
  Future<void> updateSinglefield(Map<String, dynamic> map) async {
    try {
      await _user
          .collection('Users')
          .doc(AuthRepository.instance.authUser!.uid)
          .update(map);
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
      // 'something went wrong . try again';
    }
  }

  //======//
  Future<void> removeUser(String userId) async {
    try {
      await _user.collection('Users').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong . try again';
    }
  }

  //======//
  Future<void> uploadImage(String image) async {
    try {
      await _user.collection('Users').doc(userId).update({
        'profilePicture': image,
      });
      // await ref.putFile(File(image.path));
      // final url = await ref.getDownloadURL();
      // return url;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
      // 'something went wrong . try again*';
    }
  }
}
