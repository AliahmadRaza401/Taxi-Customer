import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/constants/app_images.dart';
import 'package:game_on/core/widgets/double_lines_painter.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/get.dart';

class ContinueScreen extends StatelessWidget {
  const ContinueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kwhite,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: DoubleLinesPainter(
                  lineCount: 50,
                  lineColor: Colors.grey,
                  lineWidth: 1.6,
                  maxOffset: 5.0,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 20),
                Image.asset(AppImages.appLogo, height: 90.w),
                Container(
                  width: 597,
                  height: 320,
                  decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.3),
                    //     spreadRadius: 4,
                    //     blurRadius: 10,
                    //     offset: const Offset(0, 4),
                    //   ),
                    // ],
                  ),
                  child: Image.asset(
                    AppImages.garotaFutebol,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'WHERE PASSION\nMEETS PLAY',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kgreenColor,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Book your favorite sports activity now',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                   PrimaryButton(text: 'login', onTap: (){
                    Get.toNamed(AppRoutes.signIn);
                   }),
                      const SizedBox(height: 12),
                   PrimaryButton(text: 'Create Account',color: AppColors.primaryappcolor, onTap: (){

                    Get.toNamed(AppRoutes.signup);
                   })
                    ],
                  ),
                ),
                const Spacer(),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: 
                     Text(
                      'continue as guest',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kgreenColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.kgreenColor,
                          decorationThickness: 2.0,
                          height: 1.4
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
