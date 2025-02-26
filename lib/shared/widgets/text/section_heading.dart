import 'package:flutter/material.dart';


class MSectionHeading extends StatelessWidget {
  const MSectionHeading({
    super.key,
    this.textColor,
    required this.titel,
    this.buttonTitel = 'view all',
    this.showButtonText = true,
    this.onPressed,
  });
  final Color? textColor;
  final String titel, buttonTitel;
  final bool showButtonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titel,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showButtonText)
          TextButton(onPressed: onPressed, child: Text(buttonTitel)),
      ],
    );
  }
}
