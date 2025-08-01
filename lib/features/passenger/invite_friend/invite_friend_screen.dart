import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/constants/app_images.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/core/widgets/custom_text.dart';
import 'package:game_on/core/widgets/custom_textfield.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'invite_friend_controller.dart';

class InviteFriendScreen extends GetView<InviteFriendController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Invite Friend'),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Image.asset(AppImages.inviteFriend, width: 182.w, height: 186.h),
              SizedBox(height: 30.h),
              Text(
                "Invite Friends",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
        
              SizedBox(
                width: Get.width * 0.7,
                child: CText(
                  text:
                      'When your friends sign up this referral code, you can received a free ride',
                  fontSize: 16.sp,
                  maxLines: 2,
                  alignText: TextAlign.center,
                  color: AppColors.headingcolor.withOpacity(0.5),
                ),
              ),
              SizedBox(height: 20.h),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CText(
                    text: 'Share your invite code',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ],
              ),
        
              CustomTextField(
                controller: TextEditingController(
                  text: controller.inviteCode.value,
                ),
                hintText: 'Enter Invite Code',
                keyboardType: TextInputType.text,
                textcolor: AppColors.primaryappcolor,
                onChange: (val) => controller.inviteCode.value = val!,
              ),
              
              SizedBox(height: 20),
            PrimaryButton(text: 'Invite', 
            width: double.infinity,
            onTap: (){
Get.toNamed(AppRoutes.inviteFriendRefer);
            })
            ],
          ),
        ),
      ),
    );
  }
}
