import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import 'brand_titel_text.dart';

class MBrandTitleWithVerifyIcon extends StatelessWidget {
  const MBrandTitleWithVerifyIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.textColor,
    this.iconColor = MColors.primary,
    this.brandTextSize = TextSizes.small,
  });
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final Color? textColor, iconColor;
  final TextSizes brandTextSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: MBrandTitleText(
            title: title,
            brandTextSize: brandTextSize,
            maxLines: maxLines,
            textAlign: textAlign,
            textColor: textColor,
          ),
        ),
        const SizedBox(width: MSizes.xs),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: MSizes.iconXs,
        )
      ],
    );
  }
}
