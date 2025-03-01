import 'package:flutter/material.dart';
import 'package:cake_and_smile/utils/constants/colors.dart';


class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          child: Divider(
            color: MColors.darkGrey,
            thickness: 0.5,
            indent: 40,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Flexible(
          child: Divider(
            color: MColors.darkGrey,
            thickness: 0.5,
            indent: 5,
            endIndent: 40,
          ),
        ),
      ],
    );
  }
}
