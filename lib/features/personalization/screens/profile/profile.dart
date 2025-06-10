import 'package:cake_and_smile/features/personalization/controllers/user_controller.dart';
import 'package:cake_and_smile/shared/images/circular_image.dart';
import 'package:cake_and_smile/shared/widgets/appbar/appbar.dart';
import 'package:cake_and_smile/shared/widgets/text/section_heading.dart';
import 'package:cake_and_smile/utils/constants/image_strings.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../settings/change_name/change_name.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
      appBar: const MAppBar(titel: Text('Profile'), backArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Obx(
                      () {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : MImages.user;

                        return MCircularImage(
                          image: image,
                          width: 80,
                          height: 80,
                          isNetworkImage: networkImage.isNotEmpty,
                        );
                      },
                    ),
                    Positioned(
                        right: 0,
                        top: -5,
                        child: TextButton(
                            onPressed: () {
                              // controller.uploadUserProfilePicture();
                            },
                            child: const Text('Change profile picture')))
                  ],
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItems),
              const MSectionHeading(
                titel: 'Profile info',
                showButtonText: false,
              ),
              const SizedBox(height: MSizes.spaceBtwItems),
              MProfileMenu(
                title: 'Name:',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(const ChangeName()),
              ),
              MProfileMenu(
                title: 'Username:',
                value: controller.user.value.userName,
                onPressed: () {},
              ),

              //=============
              const SizedBox(height: MSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItems),
              //=========
              const MSectionHeading(
                titel: 'Personal info',
                showButtonText: false,
              ),
              const SizedBox(height: MSizes.spaceBtwItems),
              //=========
              MProfileMenu(
                title: 'User ID:',
                value: controller.user.value.id,
                onPressed: () {},
              ),
              MProfileMenu(
                title: 'E-Mail:',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              MProfileMenu(
                title: 'Phone Number: ',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              MProfileMenu(
                title: 'Gender:',
                value: '*********',
                onPressed: () {},
              ),
              MProfileMenu(
                title: 'Date of Birth:',
                value: '*********',
                onPressed: () {},
              ),
              //=====
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItems),
              //=======
              Center(
                child: TextButton(
                    onPressed: () {
                      // controller.deleteAccountWarningPopup();
                    },
                    child: const Text(
                      'Delete Account',
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
