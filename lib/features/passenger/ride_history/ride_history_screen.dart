import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/features/passenger/ride_history/ride_history_controller.dart';
import 'package:get/get.dart';

class RideHistoryScreen extends StatelessWidget {
  const RideHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RideHistoryController>();
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(text: 'Previous Rides'),
      body: Column(
        children: [
        
          // Tab Bar
          Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Obx(() => Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.selectTab(0),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: controller.selectedTab.value == 0
                            ? AppColors.kprimaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Upcoming',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: controller.selectedTab.value == 0
                              ? Colors.white
                              : Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.selectTab(1),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(
                        color: controller.selectedTab.value == 1
                            ? AppColors.kprimaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        'History',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: controller.selectedTab.value == 1
                              ? Colors.white
                              : Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
          // Rides List
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.rides.length,
                itemBuilder: (context, index) {
                  final ride = controller.rides[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${ride.date}, ${ride.time}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              '₦ ${ride.fare.toInt()}',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, color: AppColors.primaryappcolor, ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                ride.pickupLocation,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: AppColors.primaryappcolor, ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                ride.dropoffLocation,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        GestureDetector(
                          onTap: () => controller.viewRideDetails(ride),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Details',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey[600],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}