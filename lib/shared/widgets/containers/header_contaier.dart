import 'package:cake_and_smile/shared/curved/curved_edges_widget.dart';
import 'package:cake_and_smile/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import 'circular_container.dart';


class MHeaderContaier extends StatelessWidget {
  const MHeaderContaier({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
      child: Container(
        color: MColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: MCircularContainer(color: MColors.textWhite.withOpacity(0.1)),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: MCircularContainer(color: MColors.textWhite.withOpacity(0.1)),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
