import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';

class MBrandTitleText extends StatelessWidget {
  const MBrandTitleText({
    super.key,
    required this.title,
    required this.maxLines,
    this.textAlign,
    this.textColor,
    required this.brandTextSize,
  });
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final Color? textColor;
  final TextSizes brandTextSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: textColor)
          : brandTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: textColor)
              : brandTextSize == TextSizes.large
                  ? Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(color: textColor)
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: textColor),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
