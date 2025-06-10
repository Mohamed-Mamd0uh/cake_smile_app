import 'package:cake_and_smile/features/personalization/controllers/address_controller.dart';
import 'package:cake_and_smile/features/personalization/models/address_model.dart';
import 'package:cake_and_smile/features/personalization/screens/address/add_new_address.dart';
import 'package:cake_and_smile/features/personalization/screens/address/widgets/single_address.dart';
import 'package:cake_and_smile/shared/widgets/appbar/appbar.dart';
import 'package:cake_and_smile/utils/constants/colors.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/constants/text_strings.dart';
import 'package:cake_and_smile/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final a = AddressControllers.instance;

    // List<AddressModel>? data ;
    // void fetchData() async {
    //   try {
    //     data = await a.allUserAddresses();
    //     // Now 'data' contains the list of addresses
    //     // You can use it as needed (e.g., display in UI)
    //   } catch (e) {
    //     print('Error fetching addresses: $e');
    //     // Handle the error (show an error message, etc.)
    //   }
    // }

    final controller = Get.put(AddressControllers());
    return Scaffold(
      appBar: MAppBar(
        titel: Text(MTexts.address.tr,
            style: Theme.of(context).textTheme.headlineSmall),
        backArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder<List<AddressModel>>(
              key: Key(controller.refreshDate.value.toString()),
              future: controller.allUserAddresses(),
              builder: (context, snapshot) {
                //========//
                final widget = MCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot);
                if (widget != null) return widget;
                //========//
                final addresses = snapshot.data!;

                return ListView.builder(
                    itemCount: addresses.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) => MSingleAddress(
                          address: addresses[index],
                          onTap: () =>
                              controller.selectAddress(addresses[index]),
                        ));
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MColors.primary,
        onPressed: () => Get.to(const AddNewAddressScreen()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
