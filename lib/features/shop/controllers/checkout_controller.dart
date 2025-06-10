import 'package:cake_and_smile/features/shop/models/payment_method_model.dart';
import 'package:cake_and_smile/features/shop/screens/checkout/widgets/paymet_tile.dart';
import 'package:cake_and_smile/shared/widgets/text/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cake_and_smile/utils/constants/image_strings.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';


class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();
  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

     @override
void onInit() {
  selectedPaymentMethod.value = PaymentMethodModel(name: 'Paypal', image: MImages.paypal);
  super.onInit();
}

Future<dynamic> selectPaymentMethod(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (__) => SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(MSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MSectionHeading( titel: 'Select Payment Method', showButtonText: false,),
            const SizedBox(height: MSizes.spaceBtwSections),
            MPaymentTile(paymentMethod: PaymentMethodModel(name:'PayPal', image:MImages.paypal)),
            const SizedBox(height : MSizes.spaceBtwItems/2),
            MPaymentTile(paymentMethod : PaymentMethodModel(name:'Google Pay', image:MImages.googlePay)),
            const SizedBox(height : MSizes.spaceBtwItems/2),
            MPaymentTile(paymentMethod : PaymentMethodModel(name:'Apple Pay', image:MImages.applePay)),
            const SizedBox(height : MSizes.spaceBtwItems/2),
            MPaymentTile(paymentMethod : PaymentMethodModel(name:'VISA', image:MImages.visa)),
            const SizedBox(height : MSizes.spaceBtwItems/2),
            MPaymentTile(paymentMethod : PaymentMethodModel(name:'MasterCard', image:MImages.masterCard)),
            const SizedBox(height : MSizes.spaceBtwItems/2),
            MPaymentTile(paymentMethod : PaymentMethodModel(name:'Paytm', image:MImages.paytm)),
            const SizedBox(height : MSizes.spaceBtwItems/2),
            MPaymentTile(paymentMethod : PaymentMethodModel(name:'Credit Card', image:MImages.creditCard)),
            const SizedBox(height : MSizes.spaceBtwItems/2),
                        const SizedBox(height: MSizes.spaceBtwSections),

        
          ],
        ),
      ),
    ),
  );
}

}
