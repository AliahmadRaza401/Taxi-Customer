import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/constants/app_images.dart';
import 'package:game_on/core/widgets/custom_drawer.dart';
import 'package:game_on/core/widgets/custom_text.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/get.dart';
import '../controller/trip_end_controller.dart';

class TripEndScreen extends GetView<TripEndController> {
  const TripEndScreen({Key? key}) : super(key: key);
void _handleLogout(BuildContext context) {
    Navigator.of(context).pop(); // Close drawer
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Logged out')),
    );
    // Add your logout logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            drawer: CustomDrawer(
        onLogout: () => _handleLogout(context),
      ),

      backgroundColor: AppColors.kprimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: const Icon(Icons.menu, color: Colors.white),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: CText(
          text: 'Your ride completed!',
          color: Colors.white,
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trip ID – 129737',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.kprimaryColor,
                              ),
                              Container(
                                width: 2,
                                height: 30,
                                color: AppColors.kprimaryColor,
                              ),
                              Icon(
                                Icons.location_on,
                                color: AppColors.kprimaryColor,
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),

                          // Text and TextField
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CText(
                                  text: 'Street 49, Park Slope Nigeria',
                                  fontSize: 16.sp,
                                  maxLines: 2,
                                ),
                                SizedBox(height: 20),
                                Divider(color: AppColors.dividercolor),
                                SizedBox(
                                  width: Get.width * 0.5,
                                  child: CText(
                                    text: '276, Bay Ridge , Nigeria',
                                    fontSize: 16.sp,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Trip Fare',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '₦ 5000',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                'Rate your Driver',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              CircleAvatar(
                radius: 94,

                backgroundImage: AssetImage(AppImages.profileImg),
              ),
              Text(
                'Corey Schleifer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Rating 4.8 ⭐',
                style: TextStyle(color: Colors.white70),
              ),

              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('NHH–5678'),
                    SizedBox(width: 10),
                    Text('|  Suzuki Swift'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ⭐ Rating Stars
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    final isSelected = controller.selectedRating.value > index;
                    return IconButton(
                      icon: Icon(
                        Icons.star,
                        color: isSelected ? Colors.amber : Colors.grey[300],
                        size: 30,
                      ),
                      onPressed: () {
                        controller.selectedRating.value = index + 1;
                      },
                    );
                  }),
                );
              }),

              const SizedBox(height: 20),

              // Submit Button
              PrimaryButton(
                text: 'Submit',
                color: AppColors.kwhite,
                tcolor: AppColors.kprimaryColor,
                onTap: () {
                  // controller.submitRating;
                  Get.offAndToNamed(AppRoutes.pickUp);
                },
              ),

              const SizedBox(height: 10),

              // Report Button
              TextButton(
                onPressed: controller.reportDriver,
                child: const Text(
                  'Report Driver',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
