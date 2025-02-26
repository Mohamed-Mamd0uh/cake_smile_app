import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/sizes.dart';

class MAnimationLoaderWidget extends StatelessWidget {
  const MAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.actionText,
      this.showAction = false,
      this.onActionPressed});

  final String text;
  final String? actionText;
  final String animation;
  final bool showAction;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8),
        const SizedBox(height: MSizes.defaultSpace),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: MSizes.defaultSpace),
        showAction
            ? SizedBox(
                width: 250,
                child: OutlinedButton(
                  onPressed: onActionPressed,
                  child: Text(actionText!,
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
