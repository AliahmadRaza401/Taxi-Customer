import 'package:flutter/material.dart';
import 'package:game_on/core/utils/app_toast.dart';
import 'package:game_on/features/passenger/profile/profile_controller.dart';
import 'package:get/get.dart';

class UpdateEmailController extends GetxController {
  final emailController = TextEditingController();
  late ProfileController profileController;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    profileController = Get.find<ProfileController>();
    emailController.text = profileController.user.value.email;
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void updateEmail() {
    if (emailController.text.trim().isEmpty) {
      AppToast.infoToast('Error', 'Email cannot be empty');
      return;
    }

    if (!isValidEmail(emailController.text.trim())) {
      AppToast.infoToast('Error', 'Please enter a valid email address');
      return;
    }

    isLoading.value = true;
    
    // Simulate API call
    Future.delayed(Duration(milliseconds: 1500), () {
      final updatedUser = profileController.user.value.copyWith(
        email: emailController.text.trim(),
      );
      profileController.updateUser(updatedUser);
      isLoading.value = false;
      Get.back();
      AppToast.successToast('Email updated successfully');
    });
  }
}
