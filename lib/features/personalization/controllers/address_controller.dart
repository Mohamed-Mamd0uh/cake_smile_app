import 'package:cake_and_smile/data/repositories/address_repository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cake_and_smile/features/personalization/models/address_model.dart';
import 'package:cake_and_smile/features/personalization/screens/address/widgets/single_address.dart';
import 'package:cake_and_smile/shared/widgets/text/section_heading.dart';
import 'package:cake_and_smile/utils/constants/image_strings.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/helpers/cloud_helper_functions.dart';
import 'package:cake_and_smile/utils/helpers/network_manager.dart';
import 'package:cake_and_smile/utils/loader/loaders.dart';
import 'package:cake_and_smile/utils/popups/full_screen_loader.dart';

class AddressControllers extends GetxController {
  static AddressControllers get instance => Get.find();
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postaCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> adderessFormKey = GlobalKey<FormState>();

  RxBool refreshDate = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressrepository = Get.put(AddressRepository());
  Future<List<AddressModel>> allUserAddresses() async {
    // try {
    // Assuming addressrepository is correctly initialized

    final addresses = await addressrepository.fetchUserAddresses();

    // Assuming selectedAddress.value is a valid variable
    selectedAddress.value = addresses.firstWhere(
      (element) => element.selectedAddress,
      orElse: () => AddressModel.empty(),
    );

    // Print the first address name (for debugging purposes)

    return addresses;
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext bc) => Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const MSectionHeading(
                titel: 'Select Address', showButtonText: false),
            FutureBuilder(
              future: allUserAddresses(),
              builder: (_, snapshot) {
                // if (!snapshot.hasData) return const RecordOrError message();
                final response = MCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot);
                if (response != null) return response;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => MSingleAddress(
                    address: snapshot.data![index],
                    onTap: () async {
                      await selectAddress(snapshot.data![index]);
                      Get.back();
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: MSizes.defaultSpace * 2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(addNewAddresses()),
                  child: const Text('Add new address')),
            ),
          ],
        ),
      ),
    );
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      if (selectedAddress.value.id.isNotEmpty) {
        await addressrepository.updateSelectedField(
            selectedAddress.value.id, false);
      }
      //=======//

      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;
      //=======//
      await addressrepository.updateSelectedField(
          selectedAddress.value.id, true);
    } catch (e) {
      Mloaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future addNewAddresses() async {
    try {
      //====loader===//
      MFullScreenLoader.openLoadingDialog(
          'Storing Address...', MImages.docerAnimation);
      //=== Check Connected ====/
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MFullScreenLoader.stopLoading();
        return;
      }
      //====validate===//
      if (!adderessFormKey.currentState!.validate()) {
        MFullScreenLoader.stopLoading();
        return;
      }
      //======//

      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postaCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );
      final id = await addressrepository.addAddress(address);
      //=========//
      address.id = id;
       selectedAddress(address);
      //=========//
      MFullScreenLoader.stopLoading();

      //=========//
      Mloaders.successSnackBar(
          title: 'Successful',
          message: 'your address has been saved successfully');
      //=========//
      refreshDate.toggle();

      //=========//
      resetFormFields();
      //=========//
      Navigator.of(Get.context!).pop();
    } catch (e) {
      MFullScreenLoader.stopLoading();
      Mloaders.errorSnackBar(title: 'Error..', message: e.toString());
    }
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    city.clear();
    state.clear();
    postaCode.clear();
    country.clear();
    adderessFormKey.currentState?.reset();
  }
}
