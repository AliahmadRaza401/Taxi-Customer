import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:game_on/core/constants/app_colors.dart';

class AppToast {
  static successToast(msg) {
    return Get.snackbar(
      'Success!', msg.toString(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.greenAccent,
      colorText: Colors.white,
      maxWidth: Get.size.width * 0.8,
      // margin: EdgeInsets.all(kHorizontalSpacing)
    );
  }

  static failToast(msg) {
    return Get.snackbar(
      'Oops!', msg.toString(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent ,
      colorText: Colors.white,
      maxWidth: Get.size.width * 0.8,
      // margin: EdgeInsets.all(kHorizontalSpacing)
    );
  }

  static infoToast(title, msg) {
    return Get.snackbar(
      '$title', msg.toString(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.yellow,
      colorText: AppColors.backgroundColor,
      maxWidth: Get.size.width * 0.8,
      // margin: EdgeInsets.all(kHorizontalSpacing)
    );
  }
}