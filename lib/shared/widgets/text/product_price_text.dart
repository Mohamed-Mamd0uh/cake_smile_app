import 'package:flutter/material.dart';

class MProductPriceText extends StatelessWidget {
  const MProductPriceText({
    super.key,
    required this.price,
     this.maxLines=1,
     this.isLarge=false,
     this.lineThrough=false,
     this.currencySign='\$',
      this.style=false,
  });
  final String price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;
  final String currencySign;
  final bool style;
  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign+price,
      style:style?Theme.of(context).textTheme.titleSmall!.apply(decoration: lineThrough? TextDecoration.lineThrough:null):
       isLarge?
      Theme.of(context).textTheme.headlineMedium!.apply(decoration:lineThrough? TextDecoration.lineThrough:null)
      :Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough? TextDecoration.lineThrough:null),   
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}
