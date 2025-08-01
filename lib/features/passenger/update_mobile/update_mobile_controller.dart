import 'package:flutter/material.dart';
import 'package:game_on/core/utils/app_toast.dart';
import 'package:game_on/features/passenger/profile/profile_controller.dart';
import 'package:get/get.dart';

class UpdateMobileController extends GetxController {
  final mobileController = TextEditingController();
  late ProfileController profileController;
  var isLoading = false.obs;
  var selectedCountryCode = '+234'.obs;

  @override
  void onInit() {
    super.onInit();
    profileController = Get.find<ProfileController>();
    //  ============= Extract mobile number without country code =============
    String fullMobile = profileController.user.value.mobile;
    if (fullMobile.startsWith('+234')) {
      mobileController.text = fullMobile.substring(4).trim();
    } else {
      mobileController.text = fullMobile;
    }
  }

  @override
  void onClose() {
    mobileController.dispose();
    super.onClose();
  }

  void updateMobile() {
    if (mobileController.text.trim().isEmpty) {
      AppToast.infoToast('Error', 'Mobile number cannot be empty');
      return;
    }

    isLoading.value = true;
    
    // =============== API call ==================
    Future.delayed(Duration(milliseconds: 1500), () {
      final updatedUser = profileController.user.value.copyWith(
        mobile: '${selectedCountryCode.value} ${mobileController.text.trim()}',
      );
      profileController.updateUser(updatedUser);
      isLoading.value = false;
      Get.back();
      AppToast.infoToast('Success', 'Mobile number updated successfully');
    });
  }
}

