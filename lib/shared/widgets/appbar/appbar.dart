import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

class MAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MAppBar({
    super.key,
    this.backArrow = false,
    this.titel,
    this.actions,
    this.leadingIcon,
    this.onPressed,
  });
  final bool backArrow;
  final Widget? titel;
  final List<Widget>? actions;
  final IconData? leadingIcon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MSizes.md),
      child: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: backArrow,
        leading: backArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Iconsax.arrow_left,
                  size: 30,
                  color: MColors.primary,
                ))
            : leadingIcon != null
                ? IconButton(onPressed: onPressed, icon: Icon(leadingIcon))
                : null,
        actions: actions,
        title: titel,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MDeviceUtils.getAppBarHeight());
}
