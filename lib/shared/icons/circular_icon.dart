import 'package:flutter/material.dart';



import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class MCircularIcon extends StatelessWidget {
  const MCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size=MSizes.lg,
    this.backgroundColor,
    this.color,
    required this.icon,
    this.onPressed,
  });

  final double? width, height, size;
  final Color? backgroundColor;
  final Color? color;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : dark
                ? MColors.black.withOpacity(0.9)
                : MColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
