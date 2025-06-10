import 'package:cake_and_smile/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class MRoundedImage extends StatelessWidget {
  const MRoundedImage({
    super.key,
    this.width,
    this.height,
    this.applyImageRadius = true,
    this.isNetworkImage = false,
    this.backgroundColor,
    this.boxShadow = false,
    this.fit = BoxFit.cover,
    this.ontap,
    this.padding,
    this.border,
    this.borderRadius = MSizes.md,
    required this.image,
  });
  final double? width, height;
  final double borderRadius;
  final bool applyImageRadius;
  final bool isNetworkImage, boxShadow;
  final Color? backgroundColor;
  final BoxFit? fit;
  final VoidCallback? ontap;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          boxShadow: boxShadow
              ? [
                  BoxShadow(
                    color: MColors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ]
              : null,
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImage
                ? NetworkImage(image)
                : AssetImage(image) as ImageProvider,
          ),
        ),
      ),
    );
  }
}
