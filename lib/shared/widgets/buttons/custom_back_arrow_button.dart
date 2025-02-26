import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';

class CustomBackArrowButton extends StatelessWidget {
  const CustomBackArrowButton({
    super.key,
    required this.isAr,
    required this.size,
    // required this.onPressed,
  });

  final bool isAr;
  final double size;
  // finalFunction()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      // alignment: Alignment.topRight,
      decoration: BoxDecoration(
        color: MColors.light.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(isAr ? Icons.chevron_right : Icons.chevron_left,
            color: MColors.black, size: 35),
        onPressed: () => Get.back(),
      ),
    );
  }
}
