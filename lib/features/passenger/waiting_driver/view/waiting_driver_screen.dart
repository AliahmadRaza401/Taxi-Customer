import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/constants/app_images.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/core/widgets/custom_text.dart';
import 'package:game_on/core/widgets/custom_textfield.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:game_on/features/passenger/driver_found/controller/driver_found_controller.dart';
import 'package:game_on/features/passenger/pick_up/controller/location_controller.dart';
import 'package:game_on/features/passenger/pick_up/view/cancel_ride_screen.dart';
import 'package:game_on/features/passenger/waiting_driver/controller/waiting_driver_controller.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WaitingDriverScreen extends GetView<WaitingDriverController> {
  WaitingDriverScreen({super.key});
  final DriverFoundController dController = DriverFoundController();
  final LocationController Scontroller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Get.toNamed(AppRoutes.sos);
        },
        backgroundColor: AppColors.kprimaryColor,
        shape: const CircleBorder(),
        child: const Text('SOS', style: TextStyle(color: Colors.white)),
      ),
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
            initialChildSize: 0.3,
            minChildSize: 0.1,
            maxChildSize: 0.3,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: AppColors.kprimaryColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),

                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.kprimaryColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Obx(() {
                      final selected = Scontroller
                          .rideOptions[Scontroller.selectedRide.value];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 80,
                              height: 5,
                              decoration: BoxDecoration(
                                color: AppColors.kwhite,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Confirm Your Ride",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.kwhite),
                            ),
                            child: ListTile(
                              leading: Image.asset(
                                selected.iconPath,
                                width: 40,
                                height: 40,
                              ),
                              title: Text(
                                '${selected.name} - ₦${selected.price}',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                selected.description,
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          PrimaryButton(
                            text: 'Cancel',
                            color: AppColors.kwhite,
                            width: double.infinity,
                            tcolor: AppColors.kprimaryColor,
                            bcolor: AppColors.kprimaryColor,
                            onTap: () {
                       Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => const CancelRideScreen()),
);

                            },
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              );
            },
          ),

          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     padding: const EdgeInsets.all(16),
          //     decoration: const BoxDecoration(
          //       color: Colors.redAccent,
          //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          //     ),
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Obx(() => Text("Driver is on the way (${controller.driverEta.value})",
          //             style: const TextStyle(color: Colors.white))),
          //         const SizedBox(height: 8),
          //         Obx(() => Text("₦${controller.fare.value}",
          //             style: const TextStyle(color: Colors.white))),
          //         const SizedBox(height: 8),
          //         ElevatedButton(
          //           onPressed: controller.cancelRide,
          //           child: const Text("Cancel"),
          //           style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

class AddressBox extends StatelessWidget {
  final String text;
  const AddressBox(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(fontSize: 14)),
    );
  }
}
