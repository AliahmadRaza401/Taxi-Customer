import 'package:flutter/material.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:get/get.dart';
import 'update_name_controller.dart'; // import your controller properly

class UpdateNameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UpdateNameController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(text: 'Name'),
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
                    'Update your Name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.grey[600]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.kprimaryColor),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : controller.updateName,
                        style: ElevatedButton.styleFrom(
                          // backgroundColor: Color(0xffEEEEEE),
                          backgroundColor: AppColors.kgreyEE,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: controller.isLoading.value
                            ? CircularProgressIndicator(color: AppColors.kprimaryColor)
                            : Text(
                                'Update',
                                style: TextStyle(
                                  // color: Color(0xff9E9E9E),
                                  color: AppColors.kgrey9E,
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
