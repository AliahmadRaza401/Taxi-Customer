import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/constants/app_images.dart';
import 'package:game_on/core/widgets/custom_phone_textfield.dart';
import 'package:game_on/core/widgets/custom_text.dart';
import 'package:game_on/core/widgets/custom_textfield.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackgroundColor,
      body: Column(
        children: [
          Stack(
            children: [
              SvgPicture.asset(AppImages.upperbg, fit: BoxFit.cover),
              // Positioned(
              //   top: 20.h,
              //   left: 10.w,
              //   child: IconButton(
              //     icon: const Icon(Icons.arrow_back, color: Colors.white),
              //     onPressed: () => Get.back(),
              //   ),
              // ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 0.15.sh),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CText(
                        text: 'Sign Up!',
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: Get.width * 0.7,
                        child: CText(
                          text:
                              'Please fill your details below to complete your account',
                          fontSize: 16.sp,
                          color: Colors.white,
                          maxLines: 2,
                          alignText: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: TextEditingController(),
                          hintText: 'First Name',
                          hasPreffix: true,
                          keyboardType: TextInputType.text,
                          textcolor: AppColors.primaryappcolor,
                          preffixIcon: const Icon(Icons.person),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: CustomTextField(
                          controller: TextEditingController(),
                          hintText: 'Last Name',
                          hasPreffix: true,
                          preffixIcon: const Icon(Icons.person),
                          keyboardType: TextInputType.text,
                          textcolor: AppColors.primaryappcolor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  CustomTextField(
                    controller: TextEditingController(),
                    hintText: 'Email',
                    hasPreffix: true,
                    preffixIcon: const Icon(Icons.mail),
                    keyboardType: TextInputType.emailAddress,
                    textcolor: AppColors.primaryappcolor,
                  ),
                  SizedBox(height: 15.h),
                  PhonePickerField(
                    width: double.infinity,
                    controller: TextEditingController(),
                    hintText: '(518) 458 8877',
                  ),
                  SizedBox(height: 25.h),

                  PrimaryButton(
                    text: 'Sign Up',
                    onTap: () {
                      // Get.toNamed(AppRoutes.bottombar);
                      Get.toNamed(AppRoutes.otp);
                    },
                    width: double.infinity,
                  ),

                  SizedBox(height: 20.h),
                    Center(
                      child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(color: Colors.black, fontSize: 14.sp),
                        children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: GestureDetector(
                          onTap: () {
                            log('go to login');
                            Get.toNamed(AppRoutes.signIn);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                            color: AppColors.kbluedark,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            height: 1.5,
                            ),
                          ),
                          ),
                        ),
                       
                        ],
                      ),
                      ),
                    ),

                  SizedBox(height: 15.h),
                  Center(
                    child: CText(text: 'or', fontSize: 16.sp),
                  ),
                  SizedBox(height: 15.h),
                  Center(
                    child: Text(
                      'Continue with',

                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(height: 15.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialIcon('assets/app_icons/facebook.svg'),
                      SizedBox(width: 20.w),
                      _socialIcon(AppImages.google),
                      SizedBox(width: 20.w),
                      _socialIcon(AppImages.apple),
                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(String path) {
    return Container(
      width: 48,
      height: 48,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300,
      ),
      child: SvgPicture.asset(path, fit: BoxFit.contain),
    );
  }
}
