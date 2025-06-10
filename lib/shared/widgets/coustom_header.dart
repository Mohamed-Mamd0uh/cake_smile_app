import 'package:cake_and_smile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoustomHeader extends StatelessWidget {
  const CoustomHeader(
      {super.key, required this.title, this.onTap, this.button = true});
  final String title;
  final void Function()? onTap;
  final bool button;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        if (button)
          TextButton(
            onPressed: onTap,
            child: Text(MTexts.showAll.tr),
          ),
      ],
    );
  }
}
