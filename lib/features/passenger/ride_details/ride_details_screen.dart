import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/features/passenger/ride_details/ride_details_controller.dart';
import 'package:get/get.dart';

class RideDetailsScreen extends StatelessWidget {
  const RideDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RideDetailsController>();
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(text: 'Previous Rides'),
      body: Obx(() {
        final ride = controller.selectedRide.value;
        if (ride == null) return Center(child: Text('No ride data'));
        
        return Column(
          children: [
            
            // Tab Bar
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Upcoming',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(
                        color: AppColors.kprimaryColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        'History',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //  ================= Ride Details ====================
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
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
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            '₦ ${ride.fare.toInt()}',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.headingcolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, color: AppColors.kprimaryColor),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              ride.pickupLocation,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: AppColors.kprimaryColor),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              ride.dropoffLocation,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => controller.toggleDetails(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Details',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14.sp,
                              ),
                            ),
                            Icon(
                              controller.showDetails.value
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.grey[600],
                            ),
                          ],
                        ),
                      ),
                      if (controller.showDetails.value) ...[
                        SizedBox(height: 16.h),
                        // ============== Driver Info ===============
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[300],
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ride.driverName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '${ride.driverCode} • ${ride.driverVehicle}',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: List.generate(5, (index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              )),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'You travelled ${ride.distance} km in ${ride.duration} mins',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 16),
                        // ==============  Fare Breakdown =================
                        _buildFareRow('Service fee', ride.serviceFee),
                        _buildFareRow('Waiting fee', ride.waitingFee),
                        _buildFareRow('${ride.peakFactor} Peak factor', 0),
                        _buildFareRow('Ride charges', ride.rideCharges),
                        Divider(height: 24),
                        _buildFareRow('Total fare', ride.fare, isTotal: true),
                        SizedBox(height: 16),
                        // Map Preview
                        GestureDetector(
                          onTap: () => controller.viewOnMap(),
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.map,
                                size: 48,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildFareRow(String label, double amount, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black : Colors.grey[600],
            ),
          ),
          Text(
            '₦ ${amount.toInt()}',
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black : Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}