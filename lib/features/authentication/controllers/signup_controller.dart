import 'package:cake_and_smile/data/repositories/auth_repository.dart';
import 'package:cake_and_smile/data/repositories/user_repository.dart';
import 'package:cake_and_smile/features/authentication/models/user_model.dart';
import 'package:cake_and_smile/features/authentication/screens/sign_up/verify_email.dart';
import 'package:cake_and_smile/utils/constants/image_strings.dart';
import 'package:cake_and_smile/utils/helpers/network_manager.dart';
import 'package:cake_and_smile/utils/loader/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/popups/full_screen_loader.dart';

// class SignupController extends GetxController {

// final formKey = GlobalKey<FormState>();
// final firstName = TextEditingController();
// final lastName = TextEditingController();
// final username = TextEditingController();
// final email = TextEditingController();
// final phone = TextEditingController();
// final password = TextEditingController();
//   RxBool hidePassword = true.obs;
//   RxBool privacyPolicy = false.obs;

//   void togglePasswordVisibility() => hidePassword.value = !hidePassword.value;
// }
class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final userName = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final keySignup = GlobalKey<FormState>();
  void togglePasswordVisibility() => hidePassword.value = !hidePassword.value;
  Future<void> signup() async {
    final userRepository = Get.put(UserRepository());
    final authRepository = Get.put(AuthRepository());
    try {
      //====loader===//
      MFullScreenLoader.openLoadingDialog(
          'We are processing your information...', MImages.docerAnimation);
      
      //==== Check Connected ====/
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MFullScreenLoader.stopLoading();
        return;
      }

      //====validate====//
      if (!keySignup.currentState!.validate()) {
        MFullScreenLoader.stopLoading();
        return;
      }
      //==== privacy policy ====//

      if (!privacyPolicy.value) {
        Mloaders.warningSnackBar(title: 'Accept privacy Policy');
        return;
      }
      //==== register with email and password ====//
      final userCredention = await authRepository.registerWithEmailaAndPassword(
          email.text.trim(), password.text.trim());

      //==== create user ====//
      final newUser = UserModel(
        id: userCredention.user!.uid,
        email: email.text,
        userName: userName.text,
        firstName: firstName.text,
        lastName: lastName.text,
        phoneNumber: phoneNumber.text,
        profilePicture: '',
      );

      //====

      await userRepository.saveUserRecord(newUser);
      //
      MFullScreenLoader.stopLoading();
      Mloaders.successSnackBar(title: 'Successfull');
      //====
      Get.to(VerfiyEmailScreen(email: email.text.trim()));
    } catch (e) {
      MFullScreenLoader.stopLoading();
      Mloaders.errorSnackBar(title: 'Error..', message: e.toString());

    }
  }
}
