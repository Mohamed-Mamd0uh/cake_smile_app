import 'package:flutter/material.dart';
import 'package:cake_and_smile/shared/widgets/containers/rounded_container.dart';
import 'package:cake_and_smile/utils/constants/colors.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';

class MCouponCode extends StatelessWidget {
  const MCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MRoundedContainer(
      showBorder: true,
      backgroundColor: MColors.white,
      padding: const EdgeInsets.only(
          top: MSizes.sm, bottom: MSizes.sm, right: MSizes.sm, left: MSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),

          ///=========
          SizedBox(
            width: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: MColors.white.withOpacity(0.5),
                  backgroundColor: MColors.grey.withOpacity(0.2),
                  side: BorderSide(color: MColors.grey.withOpacity(0.2))),
              onPressed: () {},
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
