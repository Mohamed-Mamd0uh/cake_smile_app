import 'dart:async';

import 'package:cake_and_smile/shared/widgets/success_screen/success_screen.dart';
import 'package:cake_and_smile/utils/constants/image_strings.dart';
import 'package:cake_and_smile/utils/constants/text_strings.dart';
import 'package:cake_and_smile/utils/loader/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/repositories/auth_repository.dart';

class VerfiyEmailController extends GetxController {
  static VerfiyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    super.onInit();
  }

//====//

  sendEmailVerification() async {
    try {
      await AuthRepository.instance.sendEmailVerification();
    } catch (e) {
      Mloaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  //====//

  setTimerForAuthRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser!.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user!.emailVerified) {
          timer.cancel();
        }

        Get.offAll(SuccessScreen(
          title: MTexts.yourAccountCreatedTitle.tr,
          image: MImages.successfullyRegisterAnimation,
          subTitel: MTexts.yourAccountCreatedSubTitle.tr,
          onPressed: () => AuthRepository.instance.screenRedirect(),
        ));
      },
    );
  }

  //===//
  checkEmailVerifiedStatus() {
    try{
    FirebaseAuth.instance.currentUser!.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(SuccessScreen(
          title: MTexts.yourAccountCreatedTitle.tr,
          image: MImages.successfullyRegisterAnimation,
          subTitel: MTexts.yourAccountCreatedSubTitle.tr,
          onPressed: () => AuthRepository.instance.screenRedirect(),
        ));
      }
     
     
    }
    }
    catch(e){
      Mloaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
