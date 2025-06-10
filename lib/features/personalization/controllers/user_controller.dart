import 'package:cake_and_smile/data/repositories/auth_repository.dart';
import 'package:cake_and_smile/data/repositories/user_repository.dart';
import 'package:cake_and_smile/features/authentication/models/user_model.dart';
import 'package:cake_and_smile/features/authentication/screens/sign_in/signin_screen.dart';
import 'package:cake_and_smile/utils/constants/image_strings.dart';
import 'package:cake_and_smile/utils/constants/sizes.dart';
import 'package:cake_and_smile/utils/helpers/network_manager.dart';
import 'package:cake_and_smile/utils/loader/loaders.dart';
import 'package:cake_and_smile/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;
  final userRepository = Get.put(UserRepository());

  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  final reAuthKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    super.onInit();
    await fetchUserRecord();
  }

  fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      fetchUserRecord();

      //======//
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');
          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: nameParts[0],
              lastName: nameParts.length > 1 ? nameParts.sublist(1).join() : '',
              userName: username,
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? '');
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      Mloaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. you can re-save your data in profile');
    }
  }

  //=====//

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(MSizes.lg),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: MSizes.lg),
            child: Text('Delete')),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

//=========//

  void deleteUserAccount() async {
    try {
      MFullScreenLoader.openLoadingDialog('Processing', MImages.docerAnimation);

      /// First re-authenticate user
      final auth = AuthRepository.instance;
      var provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.siginWithGoogle();

          await auth.deleteAccount();
          MFullScreenLoader.stopLoading();
          Get.offAll(() => const SignInScreen());
        } else if (provider == 'password') {
          MFullScreenLoader.stopLoading();
          // Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      MFullScreenLoader.stopLoading();
      Mloaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

//============//
  Future<void> authenticateEmailAndPassword() async {
    try {
      MFullScreenLoader.openLoadingDialog('Processing', MImages.docerAnimation);

      //Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MFullScreenLoader.stopLoading();
        return;
      }

      if (reAuthKey.currentState!.validate()) {
        MFullScreenLoader.stopLoading();
        return;
      }

      await AuthRepository.instance.authenticateWithEmailAndPassword(
          email.text.trim(), password.text.trim());
      await AuthRepository.instance.deleteAccount();
      MFullScreenLoader.stopLoading();
      Get.offAll(() => const SignInScreen());
    } catch (e) {
      MFullScreenLoader.stopLoading();
      Mloaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  //======//

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 80,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        final imageUrl = image.path;

        // await userRepository.uploadImage(image.toString());
        Map<String, dynamic> map = {'ProfilePicture': imageUrl};
        await userRepository.updateSinglefield(map);

        user.value.profilePicture = imageUrl;
        user.refresh();
        Mloaders.successSnackBar(
            title: '', message: 'your profile image has been updated');
      }
    } catch (e) {
      Mloaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
