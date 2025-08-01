import 'package:flutter/material.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/features/passenger/personal_details/personal_details_controller.dart';
import 'package:get/get.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PersonalDetailsController>();
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(text: 'Personal Details'),
      body: Column(
        children: [
          Container(
            height: 1,
            color: Colors.grey[200],
          ),
          Expanded(
            child: Obx(() {
              final user = controller.profileController.user.value;
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 8),
                children: [
                  ListTile(
                    title: Text(
                      user.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey[400],
                    ),
                    onTap: controller.navigateToUpdateName,
                  ),
                  ListTile(
                    title: Text(
                      user.mobile,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey[600],
                    ),
                    onTap: controller.navigateToUpdateMobile,
                  ),
                  ListTile(
                    title: Text(
                      user.email,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey[400],
                    ),
                    onTap: controller.navigateToUpdateEmail,
                  ),
                  ListTile(
                    title: Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey[400],
                    ),
                    onTap: controller.navigateToChangePassword,
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}