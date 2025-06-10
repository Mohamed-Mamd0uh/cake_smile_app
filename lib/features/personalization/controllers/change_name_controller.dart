import 'package:cake_and_smile/data/repositories/user_repository.dart';
import 'package:cake_and_smile/features/personalization/controllers/user_controller.dart';
import 'package:cake_and_smile/features/personalization/screens/profile/profile.dart';
import 'package:cake_and_smile/utils/constants/image_strings.dart';
import 'package:cake_and_smile/utils/helpers/network_manager.dart';
import 'package:cake_and_smile/utils/loader/loaders.dart';
import 'package:cake_and_smile/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
  



  

class UpdateNameControllers extends GetxController {
  static UpdateNameControllers get instance => Get.find();

  // final localStorage = GetStorage();
  // final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final changeNameKey = GlobalKey<FormState>();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    initializeName();

    super.onInit();
  }

  Future<void> initializeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      //====loader===//
      MFullScreenLoader.openLoadingDialog(
          'Login you in...', MImages.docerAnimation);
      //=== Check Connected ====/
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MFullScreenLoader.stopLoading();
        return;
      }
      //====validate===//
      if (!changeNameKey.currentState!.validate()) {
        MFullScreenLoader.stopLoading();
        return;
      }
      //
      Map<String, dynamic> name = {
        'FirstName': firstName.text,
        'LastName': lastName.text
      };
      await userRepository.updateSinglefield(name);
      //
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      MFullScreenLoader.stopLoading();
      //
      Mloaders.successSnackBar(
          title: 'Successful', message: 'Your name has been update');

      //
      Get.off(const ProfileScreen());
    } catch (e) {
      MFullScreenLoader.stopLoading();
      Mloaders.errorSnackBar(title: 'Error..', message: e.toString());
    }
  }
}
