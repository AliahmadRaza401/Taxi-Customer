import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/constants/app_images.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/core/widgets/custom_text.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:get/get.dart';
import 'confirmation_controller.dart';

class ConfirmationScreen extends GetView<ConfirmationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Confirmation'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(AppImages.done,width: 129.w,)
          ,
          SizedBox(height: 25.h,),
            CText(
              text: 'Thank you',
              fontSize: 20.sp,
              color: AppColors.primarybackColor,
              fontWeight: FontWeight.w600,
            ),
          SizedBox(height: 10.h,),

            SizedBox(
              width: Get.width * 0.6,
              child: CText(
                text: 'Your booking has been placed sent to John Doe',
                fontSize: 15.sp,
                maxLines: 2,
                alignText: TextAlign.center,
              ),
            ),
          SizedBox(height: Get.height*0.3,),
           PrimaryButton(text: 'Done', onTap: (){
            Get.back();
           })
          ],
        ),
      ),
    );
  }
}
