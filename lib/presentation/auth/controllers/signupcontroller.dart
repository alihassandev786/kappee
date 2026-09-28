import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // Text Editing Controllers
  final userNameController = TextEditingController();
  final whatsappNumberController = TextEditingController();
  final createPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Observables for Password Visibility & Checkbox state
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isTermsAccepted = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void toggleTerms(bool? val) {
    isTermsAccepted.value = val ?? false;
  }

  @override
  void onClose() {
    userNameController.dispose();
    whatsappNumberController.dispose();
    createPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}