import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class MTabbar extends StatelessWidget implements PreferredSizeWidget {
  const MTabbar({
    super.key,
    required this.tabs,
  });
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? MColors.dark : MColors.white,
      child: TabBar(
          isScrollable: true,
          indicatorColor: MColors.primary,
          unselectedLabelColor: MColors.darkGrey,
          labelColor: dark ? MColors.white : MColors.primary,
          tabs: tabs),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MDeviceUtils.getAppBarHeight());
}
