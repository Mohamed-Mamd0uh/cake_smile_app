import 'package:cake_and_smile/features/personalization/controllers/address_controller.dart';
import 'package:cake_and_smile/features/shop/controllers/checkout_controller.dart';
import 'package:cake_and_smile/features/shop/screens/order/widgets/order_list.dart';
import 'package:cake_and_smile/shared/widgets/appbar/appbar.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressControllers());
    Get.put(CheckoutController());
    return Scaffold(
      appBar: MAppBar(
        titel:
            Text('My Order', style: Theme.of(context).textTheme.headlineSmall),
        backArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(MSizes.defaultSpace),
        child: MOrderListItems(),
      ),
    );
  }
}
