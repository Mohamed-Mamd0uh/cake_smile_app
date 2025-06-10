import 'package:cake_and_smile/features/shop/controllers/order_controller.dart';
import 'package:cake_and_smile/navigation_menu.dart';
import 'package:cake_and_smile/shared/widgets/containers/rounded_container.dart';
import 'package:cake_and_smile/utils/constants/colors.dart';
import 'package:cake_and_smile/utils/constants/image_strings.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/helpers/cloud_helper_functions.dart';
import 'package:cake_and_smile/utils/loader/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class MOrderListItems extends StatelessWidget {
  const MOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
  
    final controller = Get.put(OrderControllers());

    return FutureBuilder(
        future: controller.fatchUserOrders(),
        builder: (context, snapshot) {
          final emptyWidget = MAnimationLoaderWidget(
            text: 'Whoops! No Orders Yet!',
            animation: MImages.orderCompletedAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          ); // AnimationLoaderWidget

          // if (!snapshot.hasData) return const RecordOrError message();
          final response = MCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;
          final orders = snapshot.data!;
          return ListView.separated(
            itemCount: orders.length,
            separatorBuilder: (_, index) =>
                const SizedBox(height: MSizes.spaceBtwItems),
            itemBuilder: (_, index) {
              final order = orders[index];
              return MRoundedContainer(
                  padding: const EdgeInsets.all(MSizes.md),
                  showBorder: true,
                  backgroundColor: MColors.light,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Row #1
                      Row(
                        children: [
                          const Icon(Iconsax.ship),
                          const SizedBox(width: MSizes.spaceBtwItems / 2),
                          //===
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(order.orderStatusText,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(
                                            color: MColors.primary,
                                            fontWeightDelta: 1)),
                                Text(order.formattedOrderDate,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                              ],
                            ),
                          ),
                          //=====
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Iconsax.arrow_right_34,
                                size: MSizes.iconSm,
                              ))
                        ],
                      ),
                      // Row #2

                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(Iconsax.tag),
                                const SizedBox(width: MSizes.spaceBtwItems / 2),
                                //===
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Order',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!),
                                      Text(order.id,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: MSizes.spaceBtwItems),
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(Iconsax.calendar),
                                const SizedBox(width: MSizes.spaceBtwItems / 2),
                                //===
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Shipping date',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                      Text(order.formattedDeliveryDate,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge),
                                    ],
                                  ),
                                ),
                                //=====
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ));
            },
          );
        });
  }
}
