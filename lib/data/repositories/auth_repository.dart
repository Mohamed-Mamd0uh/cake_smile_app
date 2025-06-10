import 'package:cake_and_smile/data/repositories/user_repository.dart';
import 'package:cake_and_smile/features/authentication/screens/onboarding/onboarding.dart';
import 'package:cake_and_smile/features/authentication/screens/sign_in/signin_screen.dart';
import 'package:cake_and_smile/features/authentication/screens/sign_up/verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../navigation_menu.dart';
import '../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/format_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  final devicesStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    // screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      if (!user.emailVerified) {
        Get.offAll(
          VerfiyEmailScreen(
            email: _auth.currentUser!.email,
          ),
        );
      } else {
        // await MLocalStorage.init(user.uid);
        Get.offAll(() => const NavigationMenu());
      }
    } else {
      devicesStorage.writeIfNull('isFristTime', false);
      if (devicesStorage.read('isFristTime') == false) {
        Get.offAll(const SignInScreen());
      } else {
        Get.offAll(const Onboarding());
      }

      ///in on Board screen
      ///final devicesStorage = GetStorage();
      ///devicesStorage.writeIfNull('isFristTime', false)
    }
  }

  //=========

  Future<UserCredential> registerWithEmailaAndPassword(
      String email, String password) async {
    try {
      return _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong . try again';
    }
  }

  //==============Verification=============//

  Future<void> sendEmailVerification() async {
    try {
      return _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
      // 'something went wrong . try again';
    }
  }
  //==============Login==============//

  Future<UserCredential> loginWithEmailaAndPassword(
      String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong . try again';
    }
  }

  //==============Forget Password==================//
  Future<void> sendPassWordResetEmail(String email) async {
    try {
      return _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
      // 'something went wrong . try again';
    }
  }
  //==============Google==================//

  Future<UserCredential?> siginWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      //
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      //
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth!.accessToken, idToken: googleAuth.idToken);
      //
      return _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong . try again';
    }
  }

  //==============Logout==================//

  Future<void> logout() async {
    try {
      return FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong . try again';
    }
  }

  //==============Delete User==================//
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUser(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //=====//
  Future<void> authenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      // Create a credential
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      // Reauthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } on FirebaseException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
