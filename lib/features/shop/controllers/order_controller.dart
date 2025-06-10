import 'package:cake_and_smile/data/repositories/auth_repository.dart';
import 'package:cake_and_smile/data/repositories/order_repository.dart';
import 'package:cake_and_smile/features/personalization/controllers/address_controller.dart';
import 'package:cake_and_smile/features/shop/controllers/cart_controller.dart';
import 'package:cake_and_smile/features/shop/controllers/checkout_controller.dart';
import 'package:cake_and_smile/features/shop/models/order_model.dart';
import 'package:cake_and_smile/navigation_menu.dart';
import 'package:cake_and_smile/shared/widgets/success_screen/success_screen.dart';
import 'package:cake_and_smile/utils/constants/enums.dart';
import 'package:cake_and_smile/utils/constants/image_strings.dart';
import 'package:cake_and_smile/utils/loader/loaders.dart';
import 'package:cake_and_smile/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
 

class OrderControllers extends GetxController {
  static OrderControllers get instance => Get.find();
  final cartController = CartController.instance;
  final addressController = AddressControllers.instance;
  final checkOutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());
//CheckoutController
  Future<List<OrderModel>> fatchUserOrders() async {
    try {
      final userOreder = await orderRepository.fetchUserOrders();
      return userOreder;
    } catch (e) {
      Mloaders.warningSnackBar(title: 'Warning', message: e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async {
    try {
      // Start Loader
      MFullScreenLoader.openLoadingDialog(
          'Processing your order', MImages.pencilAnimation);

      // Get user authentication Id
      final userId = AuthRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      // Add details
      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkOutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        items: cartController.cartItems.toList(),
      ); // OrderModel

      // Save the order to Firestore
      await orderRepository.saveOrder(order, userId);

      // Update the cart status
      cartController.clearCart();
      // Show Success screen
      Get.off(() => SuccessScreen(
            image: MImages.orderCompletedAnimation,
            title: 'Payment Successful',
            subTitel: 'Your item will be shipped soon!',
            onPressed: () => Get.offAll(()=> const NavigationMenu()),
          ));
    } catch (e) {
      Mloaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
