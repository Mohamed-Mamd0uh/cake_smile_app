import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class MTextFormFieldTheme {
  MTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor:Colors.grey,
    suffixIconColor:Colors.grey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: MSizes.fontSizeMd, color: Colors.black),
    hintStyle: const TextStyle().copyWith(fontSize: MSizes.fontSizeSm, color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: Colors.black),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: Colors.red),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor:Colors.grey,
    suffixIconColor:Colors.grey,
    // constraints: const BoxConstraints.expand(height: MSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: MSizes.fontSizeMd, color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: MSizes.fontSizeSm, color: Colors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color:Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color:Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: Colors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: Colors.red),
    ),
  );
}
