import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:get/get.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/widgets/custom_text.dart';
import 'onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryappcolor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemCount: controller.images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(controller.images[index], height: 134, width: 139),
                      SizedBox(height: 20),
                      CText(
                        text: controller.title[index],
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primarywhiteColor,
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: CText(
                          maxLines: 2,
                          alignText: TextAlign.center,
                          text: controller.subtext[index],
                          color: AppColors.primarywhiteColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.images.length,
                (i) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: controller.currentPage.value == i ? 12 : 8,
                  height: controller.currentPage.value == i ? 12 : 8,
                  decoration: BoxDecoration(
                    color: controller.currentPage.value == i
                        ? AppColors.primarywhiteColor
                        : Colors.grey.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 30),
          Obx(() {
            if (controller.currentPage.value == controller.images.length - 1) {
              return 
              PrimaryButton(text: 'Get Started',color: AppColors.kwhite,tcolor: AppColors.kbluedark, onTap: controller.goToSignup);
             
            } else {
              return SizedBox.shrink(); 
            }
          }),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
