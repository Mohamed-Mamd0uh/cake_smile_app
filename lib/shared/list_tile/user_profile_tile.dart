import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../features/personalization/controllers/user_controller.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';

class MUserProfileTile extends StatelessWidget {
  const MUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();

    return ListTile(
      leading: const MCircularImage(
        image: MImages.lightAppLogo,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: MColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: MColors.white),
      ),
      trailing: IconButton(
          onPressed: () {
            // Get.to(const ProfileScreen());
          },
          icon: const Icon(
            Iconsax.edit,
            color: MColors.white,
          )),
    );
  }
}
