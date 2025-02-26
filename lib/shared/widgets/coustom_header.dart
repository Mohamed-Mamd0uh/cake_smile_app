import 'package:flutter/material.dart';

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
            child: const Text('عرض الكل'),
          ),
      ],
    );
  }
}
