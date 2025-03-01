import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  RxBool hidePassword = true.obs;
  final password = TextEditingController();
  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void togglePasswordVisibility() => hidePassword.value = !hidePassword.value;
}