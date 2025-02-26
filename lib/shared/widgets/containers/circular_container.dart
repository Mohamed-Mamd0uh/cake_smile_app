import 'package:flutter/material.dart';

class MCircularContainer extends StatelessWidget {
  const MCircularContainer({
    super.key,
    this.child,
    this.height = 400,        
    this.width = 400,        
    this.padding = 0,
    this.radius = 400,
    this.color, this.margin,
  });
  final double? height;
  final double? width;
  final double? padding;
  final EdgeInsetsGeometry? margin;
  final double? radius;
  final Color? color;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin:margin ,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: color,
      ),
      child: child,
    );
  }
}
