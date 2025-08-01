import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/constants/app_images.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/core/widgets/custom_text.dart';
import 'package:game_on/core/widgets/custom_textfield.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:game_on/features/passenger/driver_found/controller/driver_found_controller.dart';
import 'package:game_on/features/passenger/pick_up/view/cancel_ride_screen.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverFoundScreen extends StatelessWidget {
  DriverFoundScreen({super.key});
  final DriverFoundController dController = DriverFoundController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(6.5244, 3.3792),
              zoom: 14,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(child: CustomMapAppBar(text: 'Driver')),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.1,
            maxChildSize: 0.55,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: AppColors.kprimaryColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 5,
                        decoration: BoxDecoration(
                          color: AppColors.kwhite,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Image.asset(
                        AppImages.profileImg,
                        width: 104.w,
                        height: 104.h,
                      ),

                      Obx(
                        () => CText(
                          text: dController.driverName.value,
                          color: Colors.white,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Obx(
                        () => Text(
                          "Rating ${dController.driverRating.value} ⭐",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Obx(
                        () => Container(
                          height: 30,
                          width: Get.width * 0.5,
                          decoration: BoxDecoration(
                            color: AppColors.kwhite,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: CText(
                              text:
                                  "${dController.carNumber} | ${dController.carInfo}",
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: Get.width * 0.6,
                        child: CText(
                          text:
                              'Your Driver Corey is on his way to pick you up.',
                          fontSize: 16.sp,
                          maxLines: 2,
                          alignText: TextAlign.center,
                          color: AppColors.kwhite,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        onTap: () {
                         Get.toNamed(
                              AppRoutes.chat,
                              arguments: {
                                "driverName": "Corey Schleifer",
                                "driverImage": AppImages.profileImg,
                              },
                            ); 
                        },
                        controller: TextEditingController(),
                        hintText: 'Start Chat...',
                        keyboardType: TextInputType.text,
                        textcolor: AppColors.kprimaryColor,
                        hasPreffix: true,
                        hasSuffix: true,
                        preffixIcon: Image.asset(AppImages.profileImg),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.chat,
                              arguments: {
                                "driverName": "Corey Schleifer",
                                "driverImage": AppImages.profileImg,
                              },
                            );
                          },
                          child: Icon(
                            Icons.near_me_outlined,
                            color: AppColors.kprimaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PrimaryButton(
                            text: 'Call Driver',
                            onTap: () {
                              print('pressed on call button');
                              // dController.callDriver;
                              Get.toNamed(AppRoutes.waitingDriver);
                            },
                            width: Get.width * 0.45,
                            color: AppColors.kwhite,
                            tcolor: AppColors.kprimaryColor,
                          ),
                          PrimaryButton(
                            text: 'Cancel',
                            onTap: () {
                              print('pressed on cancel button');
                              // dController.cancelRide;
                              Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => const CancelRideScreen()),
);

                            },
                            width: Get.width * 0.45,
                            color: AppColors.kwhite,
                            tcolor: AppColors.kprimaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      
      
        ],
      ),
    );
  }
}
