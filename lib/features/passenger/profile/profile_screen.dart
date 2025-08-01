import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:game_on/features/passenger/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(text: 'Profile'),
      body: Column(
        children: [
          Container(
            height: 1,
            color: Colors.grey[200],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8),
              itemCount: controller.menuItems.length,
              itemBuilder: (context, index) {
                final item = controller.menuItems[index];
                return ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      item['icon'] as IconData,
                      color: Colors.grey[600],
                      size: 20,
                    ),
                  ),
                  title: Text(
                    item['title'] as String,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.grey[600],
                  ),
                  onTap: () => controller.navigateToMenuItem(index),
                  
                );
                
              },
              
            ),
          ),
          PrimaryButton(text: 'Log out', onTap: (){
            controller.logout();
          }),
          SizedBox(height: 20.h,),
        ],
      ),
    );
  }
}

