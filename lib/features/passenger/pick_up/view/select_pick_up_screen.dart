import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/core/widgets/custom_text.dart';
import 'package:game_on/core/widgets/custom_textfield.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:game_on/features/passenger/pick_up/controller/location_controller.dart';
import 'package:game_on/features/passenger/pick_up/view/cancel_ride_screen.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/get.dart';

class SelectPickUpScreen extends StatelessWidget {
  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(text: 'Select Pickup Location'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Obx(
                () => ListView(
                  children: [
                    CText(
                      text: 'Current Location',
                      fontSize: 16.sp,
                      color: AppColors.headingcolor,
                    ),
                    CustomTextField(
                      controller: TextEditingController(),
                      hasPreffix: true,
                      preffixIcon: Icon(Icons.search),
                      hintText: 'Street 49, Park Slope',
                      keyboardType: TextInputType.text,
                      textcolor: AppColors.kprimaryColor,
                    ),
                    CText(
                      text: 'Select City',
                      fontSize: 16.sp,
                      color: AppColors.headingcolor,
                    ),
                    CustomTextField(
                      controller: TextEditingController(),
                      hasPreffix: true,
                      preffixIcon: Icon(Icons.search),
                      hintText: 'Lagos',
                      keyboardType: TextInputType.text,
                      textcolor: AppColors.kprimaryColor,
                    ),

                    /// Country Dropdown with Flag
                    SizedBox(
                      width: double.infinity,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: controller.selectedCountry.value,
                        items: controller.countries
                            .map(
                              (country) => DropdownMenuItem(
                                value: country,
                                child: Row(
                                  children: [
                                    // Image.asset(
                                    //   'assets/app_images/${country.toLowerCase()}.png',
                                    //   width: 24,
                                    //   height: 16,
                                    //   fit: BoxFit.cover,
                                    // ),
                                    // const SizedBox(width: 8),
                                    Text(country),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (val) => controller.setCountry(val!),
                      ),
                    ),

                    /// City Dropdown (based on selected country)
                    SizedBox(
                      width: double.infinity,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: controller.selectedCity.value,
                        items: controller
                            .cities[controller.selectedCountry.value]!
                            .map(
                              (city) => DropdownMenuItem(
                                value: city,
                                child: Text(city),
                              ),
                            )
                            .toList(),
                        onChanged: (val) => controller.setCity(val!),
                      ),
                    ),

                    /// Ride Options
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.rideOptions.length,
                      itemBuilder: (context, index) {
                        final ride = controller.rideOptions[index];
                        return ListTile(
                          leading: Image.asset(
                            ride.iconPath,
                            width: 40,
                            height: 40,
                          ),
                          title: Text('${ride.name} - ₦${ride.price}'),
                          subtitle: Text(ride.description),
                          trailing: Obx(
                            () => Radio<int>(
                              value: index,
                              groupValue: controller.selectedRide.value,
                              onChanged: (val) {
                                controller.selectRide(val!);
                              },
                            ),
                          ),

                          onTap: () => controller.selectRide(index),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            /// Confirm Button (open bottom sheet)
            PrimaryButton(
              text: 'Confirm Ride',
              color: AppColors.kwhite,
              tcolor: AppColors.kprimaryColor,
              bcolor: AppColors.kprimaryColor,
              width: double.infinity,
              onTap: () {
                Get.bottomSheet(
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.kprimaryColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Obx(() {
                      final selected =
                          controller.rideOptions[controller.selectedRide.value];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              borderRadius: BorderRadius.circular(10,)
                          ,    border: Border.all(color: AppColors.kwhite)
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
                          const SizedBox(height: 10),
                          PrimaryButton(
                            text: 'Confirm Booking',
                            color: AppColors.kwhite,
                            width: double.infinity,
                            tcolor: AppColors.kprimaryColor,
                            bcolor: AppColors.kprimaryColor,
                            onTap: () {
                            Get.toNamed(AppRoutes.payment);
                            },
                          ),
                          SizedBox(height: 10.h,),
                          PrimaryButton(
                            text: 'Cancel',
                            color: AppColors.kwhite,
                            width: double.infinity,
                            tcolor: AppColors.kprimaryColor,
                            bcolor: AppColors.kprimaryColor,
                            onTap: () {
                            // Get.toNamed(AppRoutes.driverFound);
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
                  isScrollControlled: true,
                );
              
              
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
