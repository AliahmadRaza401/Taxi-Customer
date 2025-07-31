import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:game_on/routes/app_routes.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  late PageController pageController;

  List<String> images = [
    'assets/app_images/Illustration.png',
    'assets/app_images/Illustration (1).png',
    'assets/app_images/Illustration (2).png',
  ];

  List<String> title = ["Set Destination", "Book a Ride", "Enjoy Your Trip"];
  List<String> subtext = [
    "Set your pickup location of where you want to go.",
    "Add dropoff location or skip it if you are unsure. Select vehicle type as your ride and book it. ",
    "You’re all set. Enjoy your trip with safety, comfort and security.",
  ];

  @override
  void onInit() {
    pageController = PageController(); 
    super.onInit();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void goToSignup() {
    Get.offAllNamed(AppRoutes.signup);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
