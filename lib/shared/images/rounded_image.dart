import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';


class MRoundedImage extends StatelessWidget {
  const MRoundedImage({
    super.key,
    this.width,
    this.height,
    this.applyImageRadius = true,
    this.isNetworkImage = false,
    this.backgroundColor ,
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
  final bool isNetworkImage;
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
