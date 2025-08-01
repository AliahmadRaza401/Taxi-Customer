import 'package:flutter/material.dart';
import 'package:game_on/features/passenger/profile/user_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileController extends GetxController {
  var user = UserModel(
    name: 'Mira Vaccaro',
    mobile: '+234 (0)8 486-6877',
    email: 'mira@example.com',
    password: 'password123',
  ).obs;

  final menuItems = [
    {'icon': Icons.person_outline, 'title': 'Personal Details'},
    {'icon': Icons.settings_outlined, 'title': 'Account settings'},
    {'icon': Icons.credit_card_outlined, 'title': 'Cards & Account'},
    {'icon': Icons.description_outlined, 'title': 'Documents'},
    {'icon': Icons.privacy_tip_outlined, 'title': 'Privacy Policy'},
  ];

  void navigateToMenuItem(int index) {
    switch (index) {
      case 0:
        Get.toNamed('/personal-details');
        break;
      case 1:
        // Account settings
        break;
      case 2:
        // Cards & Account
        break;
      case 3:
        // Documents
        break;
      case 4:
        // Privacy Policy
        break;
    }
  }

  void logout() {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Are you sure you want to logout?',
      textConfirm: 'Yes',
      textCancel: 'No',
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
        // Handle logout logic here
        Get.snackbar('Success', 'Logged out successfully');
      },
    );
  }

  void updateUser(UserModel updatedUser) {
    user.value = updatedUser;
  }
}
