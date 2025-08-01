import 'package:flutter/material.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/utils/app_toast.dart';
import 'package:game_on/features/passenger/profile/profile_controller.dart';
import 'package:game_on/features/passenger/update_name/update_name_controller.dart';
import 'package:get/get.dart';

class UpdatePasswordController extends GetxController {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  late ProfileController profileController;
  var isLoading = false.obs;
  var obscureCurrentPassword = true.obs;
  var obscureNewPassword = true.obs;
  var obscureConfirmPassword = true.obs;

  @override
  void onInit() {
    super.onInit();
    profileController = Get.find<ProfileController>();
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void toggleCurrentPasswordVisibility() {
    obscureCurrentPassword.value = !obscureCurrentPassword.value;
  }

  void toggleNewPasswordVisibility() {
    obscureNewPassword.value = !obscureNewPassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  void updatePassword() {
    if (currentPasswordController.text.trim().isEmpty) {
      // Get.snackbar('Error', 'Current password cannot be empty');
      AppToast.failToast('Current password cannot be empty');
      return;
    }

    if (newPasswordController.text.trim().isEmpty) {
      // Get.snackbar('Error', 'New password cannot be empty');
      AppToast.failToast( 'New password cannot be empty');
      return;
    }

    if (confirmPasswordController.text.trim().isEmpty) {
      // Get.snackbar('Error', 'Confirm password cannot be empty');
      AppToast.failToast('Confirm password cannot be empty');
      return;
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      AppToast.failToast('Passwords do not match');
      return;
    }

    if (newPasswordController.text.length < 6) {
      Get.snackbar('Error', 'Password must be at least 6 characters',
      colorText: AppColors.kprimaryColor
      );
      return;
    }

    isLoading.value = true;

    // ===========  API call =====================
    Future.delayed(Duration(milliseconds: 1500), () {
      final updatedUser = profileController.user.value.copyWith(
        password: newPasswordController.text.trim(),
      );

      profileController.updateUser(updatedUser);
      isLoading.value = false;
      Get.back();
      AppToast.successToast('Password updated successfully');
    });
  }
}
