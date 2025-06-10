
import 'package:cake_and_smile/data/services/setting_service.dart';
import 'package:cake_and_smile/utils/constants/image_strings.dart';
import 'package:cake_and_smile/utils/helpers/network_manager.dart';
import 'package:cake_and_smile/utils/loader/loaders.dart';
import 'package:cake_and_smile/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../data/repositories/auth_repository.dart';

class SigninController extends GetxController {
  RxBool hidePassword = true.obs;
  RxBool rememberMe = false.obs;
  final password = TextEditingController();
  final email = TextEditingController();
  final signinKey = GlobalKey<FormState>();
  void togglePasswordVisibility() => hidePassword.value = !hidePassword.value;

  late SettingService shr;
  @override
  void onInit() {
    shr = Get.find<SettingService>();
    var storedEmail = shr.sharedref.getString('REMEMBER_ME_EMAIL');
    var storedPassword = shr.sharedref.getString('REMEMBER_ME_PASSWORD');
    email.text = storedEmail ?? '';
    password.text = storedPassword ?? '';
    super.onInit();
  }

  Future<void> signin() async {
    final authRepository = Get.put(AuthRepository());
    final networkManager = Get.put(NetworkManager());
    try {
      //====loader===//
      MFullScreenLoader.openLoadingDialog(
          'Login you in...', MImages.docerAnimation);

      //=== Check Connected ====/
      final isConnected = await networkManager.isConnected();
      if (!isConnected) {
        MFullScreenLoader.stopLoading();
        return;
      }

      //====validate====//
      if (!signinKey.currentState!.validate()) {
        MFullScreenLoader.stopLoading();
        return;
      }
      //==== remember me ====//
      if (rememberMe.value) {
        shr.sharedref.setString('REMEMBER_ME_EMAIL', email.text.trim());
        shr.sharedref.setString('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      //====loader===//
      await authRepository.loginWithEmailaAndPassword(
          email.text.trim(), password.text.trim());
      //
      MFullScreenLoader.stopLoading();
      //====
      await authRepository.screenRedirect();
      //====
    } catch (e) {
      MFullScreenLoader.stopLoading();
      Mloaders.errorSnackBar(title: 'Error..', message: e.toString());
    }
  }
}
