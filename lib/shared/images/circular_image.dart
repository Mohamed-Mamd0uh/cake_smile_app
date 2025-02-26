import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import '../../shared/shimmer/shimmer_effect.dart';


import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class MCircularImage extends StatelessWidget {
  const MCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.isNetworkImage = false,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.ontap,
    this.padding = MSizes.sm,
    required this.image,
    this.overLayColor,
  });
  final double width, height, padding;
  final bool isNetworkImage;
  final Color? backgroundColor;
  final Color? overLayColor;
  final BoxFit? fit;
  final VoidCallback? ontap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: backgroundColor ??
              (MHelperFunctions.isDarkMode(context)
                  ? MColors.black
                  : MColors.white),
          borderRadius: BorderRadius.circular(100),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
              child: isNetworkImage
                  // CachedNetworkImage
                  ? CachedNetworkImage(
                      fit: fit,
                      color: overLayColor,
                      imageUrl: image,
                    //   progressIndicatorBuilder:
                    //       (context, url, downloadProgress) =>
                    //           const MShimmerEffect(width: 55, height: 55),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )
                  :image.isNotEmpty?
                  // Image
                  Image(
                      fit: fit,
                      image: AssetImage(image),
                      color: overLayColor,
                    ):const Icon(Icons.error,color: Colors.black,),
                    )
        ),
      ),
    );
  }
}
