import 'package:cake_and_smile/features/personalization/controllers/address_controller.dart';
import 'package:cake_and_smile/shared/widgets/appbar/appbar.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressControllers());
    return Scaffold(
      appBar: MAppBar(
        titel: Text('Add New Adress',
            style: Theme.of(context).textTheme.headlineSmall),
        backArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Form(
            key: controller.adderessFormKey,
            child: Column(children: [
              //===Name====//
              TextFormField(
                controller: controller.name,
                validator: (value) =>
                    MValidator.validateEmptyText('Name', value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwInputFields),
              //===Phone Number====//
              TextFormField(
                controller: controller.phoneNumber,
                validator: MValidator.validatePhoneNumber,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: 'Phone Number'),
              ),
              const SizedBox(height: MSizes.spaceBtwInputFields),
              Row(
                children: [
                  //===Street====//
                  Expanded(
                      child: TextFormField(
                    controller: controller.street,
                    validator: (value) =>
                        MValidator.validateEmptyText('Street', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.building_31),
                        labelText: 'Street'),
                  )),
                  const SizedBox(width: MSizes.spaceBtwInputFields),
                  //===Posta Code====//
                  Expanded(
                      child: TextFormField(
                    validator: (value) =>
                        MValidator.validateEmptyText('Posta Code', value),
                    controller: controller.postaCode,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.code),
                        labelText: 'Posta Code'),
                  ))
                ],
              ),
              const SizedBox(height: MSizes.spaceBtwInputFields),
              Row(
                children: [
                  //===City====//
                  Expanded(
                      child: TextFormField(
                    controller: controller.city,
                    validator: (value) =>
                        MValidator.validateEmptyText('City', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.building), labelText: 'City'),
                  )),
                  const SizedBox(width: MSizes.spaceBtwInputFields),
                  //===State====//
                  Expanded(
                      child: TextFormField(
                    controller: controller.state,
                    validator: (value) =>
                        MValidator.validateEmptyText('State', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.activity), labelText: 'State'),
                  ))
                ],
              ),
              const SizedBox(height: MSizes.spaceBtwInputFields),
              //===Country====//
              TextFormField(
                controller: controller.country,
                validator: (value) =>
                    MValidator.validateEmptyText('Country', value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
              ),
              const SizedBox(height: MSizes.defaultSpace),
              //===Save====//
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.addNewAddresses(),
                    child: const Text('Save')),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
