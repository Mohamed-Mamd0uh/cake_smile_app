import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {

final formKey = GlobalKey<FormState>();
final firstName = TextEditingController();
final lastName = TextEditingController();
final username = TextEditingController();
final email = TextEditingController();
final phone = TextEditingController();
final password = TextEditingController();
  RxBool hidePassword = true.obs;
  RxBool privacyPolicy = false.obs;

  
  void togglePasswordVisibility() => hidePassword.value = !hidePassword.value;
}