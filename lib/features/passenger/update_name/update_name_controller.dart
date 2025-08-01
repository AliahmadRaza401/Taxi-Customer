import 'package:flutter/material.dart';
import 'package:game_on/core/utils/app_toast.dart';
import 'package:game_on/features/passenger/profile/profile_controller.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  final nameController = TextEditingController();
  late ProfileController profileController;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    profileController = Get.find<ProfileController>();
    nameController.text = profileController.user.value.name;
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }

  void updateName() {
    if (nameController.text.trim().isEmpty) {
      // Get.snackbar('Error', 'Name cannot be empty');
      AppToast.infoToast('Error', 'Name cannot be empty');
      return;
    }

    isLoading.value = true;

    // ================= API call =====================
    Future.delayed(Duration(milliseconds: 1500), () {
      final updatedUser = profileController.user.value.copyWith(
        name: nameController.text.trim(),
      );
      profileController.updateUser(updatedUser);
      isLoading.value = false;
      Get.back();
      // Get.snackbar('Success', 'Name updated successfully');
      AppToast.infoToast('Success', 'Name updated successfully');
    });
  }
}
