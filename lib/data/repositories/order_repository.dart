import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:cake_and_smile/data/repositories/auth_repository.dart';
import 'package:cake_and_smile/features/shop/models/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;
  final _userId = Get.find<AuthRepository>().authUser!.uid;
  //-------------------------------------------------- FUNCTIONS

  /// Get all order related to current User
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      // final userId = AuthRepository.instance.authUser!.uid;
      if (_userId.isEmpty) {
        throw 'Unable to find user information. Try again in few minutes.';
      }
      final result =
          await _db.collection('Users').doc(_userId).collection('Orders').get();
      return result.docs
          .map(
              (documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {

      throw 'Something went wrong while fetching Order Information. Try again later';
    }
  }

  /// Store new user order
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toMap());
    } catch (e) {
      throw 'Something went wrong while saving Order Information. Try again later';
    }
  }
}
