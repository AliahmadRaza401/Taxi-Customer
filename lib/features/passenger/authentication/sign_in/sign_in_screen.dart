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

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackgroundColor,
      body: Column(
        children: [
          Stack(
            children: [
              SvgPicture.asset(AppImages.upperbg, fit: BoxFit.cover),
              Positioned(
                top: 20.h,
                left: 10.w,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 0.15.sh),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CText(
                        text: 'Hello!',
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: Get.width * 0.7,
                        child: CText(
                          text: 'Book a ride with HiTaxi',
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
                  Center(
                    child: SizedBox(
                      width: Get.width * 0.7,
                    
                      child: CText(
                        alignText: TextAlign.center,
                        text: 'Enter your mobile number to Login or Register',
                        fontSize: 18.sp,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  PhonePickerField(
                    width: double.infinity,
                    controller: TextEditingController(),
                    hintText: '(518) 458 8877',
                  ),
                  SizedBox(height: 25.h),

                  PrimaryButton(
                    text: 'Submit',
                    onTap: () {
                      Get.toNamed(AppRoutes.pickUp);
                      Get.toNamed(AppRoutes.otp);
                    },
                    width: double.infinity,
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
                    Center(
                      child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        ),
                        children: [
                        const TextSpan(text: 'By creating an account, you agree to our\n'),
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                          color: AppColors.kprimaryColor,
                          decoration: TextDecoration.underline,
                          ),
                      
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                          color: AppColors.kprimaryColor,
                          decoration: TextDecoration.underline,
                          ),
                  
                        ),
                        ],
                      ),
                      ),
                    ),
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
