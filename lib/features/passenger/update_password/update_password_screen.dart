import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/features/passenger/update_password/update_password_controller.dart';
import 'package:get/get.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UpdatePasswordController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:CustomAppBar(text: 'Password'),
      body: Column(
        children: [
          Container(height: 1, color: Colors.grey[200]),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Change your Password',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 24.h),
                  // Current Password
                  Obx(
                    () => TextField(
                      controller: controller.currentPasswordController,
                      obscureText: controller.obscureCurrentPassword.value,
                      decoration: InputDecoration(
                        labelText: 'Current Password',
                        labelStyle: TextStyle(color: Colors.grey[600]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscureCurrentPassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey[400],
                          ),
                          onPressed: controller.toggleCurrentPasswordVisibility,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

              
                  Obx(
                    () => TextField(
                      controller: controller.newPasswordController,
                      obscureText: controller.obscureNewPassword.value,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        labelStyle: TextStyle(color: Colors.grey[600]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscureNewPassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey[400],
                          ),
                          onPressed: controller.toggleNewPasswordVisibility,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

              
                  Obx(
                    () => TextField(
                      controller: controller.confirmPasswordController,
                      obscureText: controller.obscureConfirmPassword.value,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(color: Colors.grey[600]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscureConfirmPassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey[400],
                          ),
                          onPressed: controller.toggleConfirmPasswordVisibility,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : controller.updatePassword,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kprimaryColor,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: controller.isLoading.value
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                                'Update Password',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
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
}
