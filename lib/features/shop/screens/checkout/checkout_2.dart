
import 'package:cake_and_smile/shared/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

class Checkout2Screen extends StatelessWidget {
  const Checkout2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        titel: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
        backArrow: true,
      ),
      body: const Column(
        children: [
          // CartItem(item: CartItemModel()),
        ],
      ),
    );
  }
}
