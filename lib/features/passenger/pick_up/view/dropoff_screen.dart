import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/core/widgets/custom_text.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:game_on/features/passenger/pick_up/controller/location_controller.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DropoffScreen extends StatelessWidget {
  const DropoffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locationController = Get.find<LocationController>();

    return Scaffold(
      appBar: CustomMapAppBar(text: 'Dropoff Location'),
      body: GetBuilder<LocationController>(
        init: LocationController(),
        builder: (controller) {
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(6.5244, 3.3792),
                  zoom: 14,
                ),
                myLocationEnabled: true,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                markers: controller.markers.value,
                polylines: controller.polylines.value,
                onMapCreated: (GoogleMapController googleMapController) {
                  controller.mapController = googleMapController;
                },
              ),
              Positioned(
                top: 20,
                left: 20,
                right: 20,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10,
                    ),
                    child: Row(
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
                                text: controller.selectedPickUpAddress.value,
                                fontSize: 16.sp,
                                maxLines: 2,
                              ),
                              Divider(color: AppColors.dividercolor),
                              InkWell(
                                onTap: () {
                                  controller.goolePlacePicker(isPickUp: false);
                                },
                                child: CText(
                                  text:
                                      controller.selectedDropOffAddress.isEmpty
                                      ? 'Where do you want to go?'
                                      : controller.selectedDropOffAddress.value,
                                  fontSize: 16.sp,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    PrimaryButton(
                      text: 'Confirm Dropoff',
                      onTap: () {
                        Get.snackbar('Dropoff', 'Dropoff confirmed!');
                        Get.toNamed(AppRoutes.selectPickUp);
                      },
                    ),

                    const SizedBox(height: 10),
                    PrimaryButton(
                      text: 'Skip',
                      color: AppColors.kwhite,
                      bcolor: AppColors.kprimaryColor,
                      tcolor: AppColors.kprimaryColor,
                      onTap: () {
                        Get.toNamed(AppRoutes.driverFound);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
