import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class MRoundedContainer extends StatelessWidget {
  const MRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius = MSizes.md,
    this.showBorder = false,
    this.borderColor = MColors.borderPrimary,
    this.child,
    this.backgroundColor = MColors.light,
  });
  final double? width, height;
  final double borderRadius;
  final bool showBorder;
  final Color backgroundColor;
  final Color borderColor;
  final Widget? child;

  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        border: showBorder ? Border.all(color: borderColor) : null,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
