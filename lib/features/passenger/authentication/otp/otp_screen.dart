// verification_screen.dart
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_on/core/constants/app_images.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/core/widgets/custom_text.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/widgets/primary_button.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  late TapGestureRecognizer _resendTapRecognizer;

  @override
  void initState() {
    super.initState();
    _resendTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        print("Resend tapped");
      };
  }

  @override
  void dispose() {
    otpController.dispose();
    _resendTapRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                  AppImages.upperbg,
                  fit: BoxFit.cover,
           
                ),
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
                          text: 'Verification!',
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          width: Get.width * 0.7,
                          child: CText(
                            text:
                                'Please enter the 4-digit code sent to you at 418 348 8877',
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
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CText(
                    text: 'OTP Verification',
                    fontSize: 21.sp,
                    color: AppColors.kprimaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
         
            SizedBox(height: 6.h),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: CText(
                text:
                    'Enter the verification code we just sent to your +92 300 2222444',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                maxLines: 2,
              ),
            ),

            SizedBox(height: 20.h),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: PinCodeTextField(
                appContext: context,
                controller: otpController,
                length: 4,
                keyboardType: TextInputType.number,
                obscureText: false,
                autoFocus: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  inactiveColor: Colors.grey,
                  activeColor: AppColors.kprimaryColor,
                  selectedColor: AppColors.kprimaryColor,
                  inactiveFillColor: Colors.white,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  borderWidth: 1.5,
                ),
                enableActiveFill: true,
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              text: 'Submit',
              onTap: () {
                Get.toNamed(AppRoutes.pickUp);
              },
            ),
            SizedBox(height: 16.h),
            RichText(
              text: TextSpan(
                text: 'Didn’t receive a code? ',
                style: TextStyle(color: Colors.black, fontSize: 14.sp),
                children: [
                 WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: GestureDetector(
                          onTap: () {
                            log('go to resend');
                            Get.toNamed(AppRoutes.signIn);
                          },
                          child: Text(
                            'Resend',
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

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
