import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/core/widgets/custom_text.dart';
import 'package:game_on/core/widgets/custom_textfield.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:game_on/features/passenger/pick_up/controller/location_controller.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'pickup_schedule_sheet.dart';

class PickupMainScreen extends StatelessWidget {
  const PickupMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locationController = Get.find<LocationController>();

    return Scaffold(
      appBar: CustomMapAppBar(text: 'Pickup Location', leadingIcon: false),
      body: GetBuilder<LocationController>(
        init: LocationController(),
        builder: (controller) {
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: controller.currentLatLng.value,
                  zoom: 14,
                ),
                myLocationEnabled: true,
                markers: controller.markers.value,
                onMapCreated: (GoogleMapController googleMapController) {
                  controller.mapController = googleMapController;
                },
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: AppColors.kprimaryColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CText(
                            text: 'Where to?',
                            fontSize: 16.sp,
                            color: AppColors.kwhite,
                          ),

                          GestureDetector(
                            onTap: () => _showScheduleSheet(context),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: AppColors.kwhite,
                                  size: 16.w,
                                ),
                                SizedBox(width: 4.w),
                                CText(
                                  text: 'Book now',
                                  fontSize: 16.sp,
                                  color: AppColors.kwhite,
                                  fontWeight: FontWeight.w600,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.kwhite,
                                ),
                              ],
                            ),
                          ),

                          // Container(
                          //   padding: EdgeInsets.symmetric(
                          //     horizontal: 16,
                          //     vertical: 8,
                          //   ),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(8),
                          //     border: Border.all(color: Colors.grey),
                          //     color: Colors.white,
                          //   ),
                          //   child: DropdownButton<String>(
                          //     isExpanded: true,
                          //     value: null,
                          //     items: [
                          //       DropdownMenuItem(
                          //         value: 'book_now',
                          //         child: Text('Book Now'),
                          //       ),
                          //     ],
                          //     onChanged: (value) {
                          //       if (value == 'book_now') {
                          //         _showScheduleSheet(context);
                          //       }
                          //     },
                          //     hint: const Text('Select Action'),
                          //     underline: const SizedBox(),
                          //     icon: const Icon(Icons.arrow_drop_down),
                          //   ),
                          // ),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.goolePlacePicker(isPickUp: true);
                        },
                        child: CustomTextField(
                          controller: TextEditingController(),
                          enable: false,
                          hintText: controller.selectedPickUpAddress.value.isEmpty
                              ? 'Enter your destination '
                              : controller.selectedPickUpAddress.value,
                          keyboardType: TextInputType.none,
                          hasPreffix: true,
                          preffixIcon: Icon(Icons.search),

                          textcolor: AppColors.kprimaryColor,

                          // suffixIcon: Icon(Icons.skip_next),
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: CText(
                                text: '',
                                fontSize: 14.sp,
                                alignText: TextAlign.center,
                              ),
                            ),
                          ),

                          hasSuffix: true,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // PrimaryButton(
                      //   text: 'Book now',
                      //   onTap: () {
                      //     _showScheduleSheet(context);
                      //   },
                      // ),
                      // ElevatedButton(
                      //   onPressed: () => _showScheduleSheet(context),
                      //   child: const Text('Book now'),
                      // ),
                      const SizedBox(height: 10),
                      PrimaryButton(
                        width: double.infinity,
                        text: 'Confirm Pickup',
                        color: AppColors.kwhite,
                        tcolor: AppColors.kprimaryColor,
                        onTap: () {
                          Get.toNamed(AppRoutes.dropoof);
                        },
                      ),
                      // ElevatedButton(
                      //   onPressed: () => Get.toNamed('/dropoff'),
                      //   child: const Text('Confirm Pickup'),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showScheduleSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const PickupScheduleSheet(),
    );
  }
}
