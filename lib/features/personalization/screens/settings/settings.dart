import 'package:cake_and_smile/features/personalization/screens/address/address.dart';
import 'package:cake_and_smile/features/shop/screens/order/order.dart';
import 'package:cake_and_smile/shared/list_tile/setting_menu_tile.dart';
import 'package:cake_and_smile/shared/list_tile/user_profile_tile.dart';
import 'package:cake_and_smile/shared/widgets/appbar/appbar.dart';
import 'package:cake_and_smile/shared/widgets/containers/header_contaier.dart';
import 'package:cake_and_smile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cake_and_smile/localization/local_controller.dart';

import '../../../../shared/widgets/text/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocalController());
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MHeaderContaier(
              child: Column(
                children: [
                  MAppBar(
                    titel: Text(
                      MTexts.account.tr,
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                            color: MColors.white,
                          ),
                    ),
                  ),
                  const SizedBox(height: MSizes.spaceBtwSections),
                  MUserProfileTile(),
                  const SizedBox(height: MSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(MSizes.defaultSpace),
              child: Column(
                children: [
                  MSectionHeading(
                    titel: MTexts.settingsAccount.tr,
                    showButtonText: false,
                  ),
                  const SizedBox(height: MSizes.spaceBtwItems),
                  MSettingMenuTile(
                    title: MTexts.myAddresses.tr,
                    subtitle: 'setDeliveryAddress'.tr,
                    icon: Iconsax.safe_home,
                    onTap: () => Get.to(const UserAddressScreen()),
                  ),
                  // const MSettingMenuTile(
                  //     title: MTexts.myCart,
                  //     subtitle: 'Add, remove products and move to chekout',
                  //     icon: Iconsax.shopping_cart),
                  MSettingMenuTile(
                    title: MTexts.myOrders.tr,
                    subtitle: 'orderStatus'.tr,
                    icon: Iconsax.bag_tick,
                    onTap: () => Get.to(const OrderScreen()),
                  ),
                  // const MSettingMenuTile(
                  //     title: MTexts.bankAccount,
                  //     subtitle: 'Whithdraw balance to registered bank account',
                  //     icon: Iconsax.bank),
                  MSettingMenuTile(
                    title: MTexts.myCoupons.tr,
                    subtitle: 'couponList'.tr,
                    icon: Iconsax.discount_shape,
                  ),
                  MSettingMenuTile(
                    title: MTexts.notifications.tr,
                    subtitle: 'notificationSettings'.tr,
                    icon: Iconsax.notification,
                  ),
                  MSettingMenuTile(
                    title: MTexts.accountPrivacy.tr,
                    subtitle: 'dataUsage'.tr,
                    icon: Iconsax.security_card,
                  ),
                  const SizedBox(height: MSizes.spaceBtwSections),
                  //=====
                  MSectionHeading(
                    titel: MTexts.appSetting.tr,
                    showButtonText: false,
                  ),
                  const SizedBox(height: MSizes.spaceBtwItems),
                  Obx(() => MSettingMenuTile(
                    title: 'language'.tr,
                    subtitle: 'changeLanguage'.tr,
                    icon: Iconsax.language_square,
                    trailing: Switch(
                      value: controller.isArabic,
                      onChanged: (value) {
                        controller.changeLang(value ? 'ar' : 'en');
                      },
                    ),
                  )),
                  const SizedBox(height: MSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        // Get.find<AuthRepository>().logout();
                        // Get.offAll(() => const SignInScreen());
                      },
                      child: Text(
                        MTexts.logout.tr,
                        style: TextStyle(color: MColors.error.withOpacity(0.8)),
                      ),
                    ),
                  ),
                  const SizedBox(height: MSizes.spaceBtwSections * 2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
