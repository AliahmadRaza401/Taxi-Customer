import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/features/passenger/activities/activities_controller.dart';
import 'package:get/get.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ActivitiesController>();
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(text: 'Activities'),
      body: Column(
        children: [
          Container(
            height: 1,
            color: Colors.grey[200],
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              itemCount: controller.menuItems.length,
              itemBuilder: (context, index) {
                final item = controller.menuItems[index];
                return ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8.r),
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
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.grey[400],
                  ),
                  onTap: () => controller.selectMenuItem(index),
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 1,
                color: Colors.grey[200],
                indent: 16,
                endIndent: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}