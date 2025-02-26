import 'package:flutter/material.dart';

class MProductTitelText extends StatelessWidget {
  const MProductTitelText({
    super.key,
    this.smallSize = false,
    required this.titel,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });
  final bool smallSize;
  final String titel;
  final int maxLines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      titel,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
