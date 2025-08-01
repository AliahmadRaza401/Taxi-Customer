import 'package:flutter/material.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/get.dart';

class ActivitiesController extends GetxController {
  var selectedMenuItem = 0.obs;
  
  final menuItems = [
    {'icon': Icons.history, 'title': 'Ride history'},
    {'icon': Icons.receipt, 'title': 'Transactions'},
    {'icon': Icons.phone_android, 'title': 'App usage'},
  ];

  void selectMenuItem(int index) {
    selectedMenuItem.value = index;
    
    if (index == 0) {
      Get.toNamed(AppRoutes.rideHistory);
    }
  }
}

