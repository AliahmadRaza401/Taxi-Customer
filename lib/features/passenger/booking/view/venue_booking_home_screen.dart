import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/constants/app_images.dart';
import 'package:game_on/core/widgets/custom_text.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:game_on/features/passenger/booking/controller/venue_booking_controller.dart';
import 'package:game_on/features/passenger/booking/widget/premium_package_slider.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class VenueBookingHomeScreen extends StatelessWidget {
  final VenueBookingController controller = Get.put(VenueBookingController());
  final List<String> timeSlots = [
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
  ];
  final List<String> periods = ['AM', 'PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: BackButton(color: AppColors.primarybackColor),
        title: CText(text: 'Racket Ranch Padel', fontSize: 20),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            sliderWidget(controller),

            const SizedBox(height: 16),
            Row(
              children: [
                Image.asset(AppImages.lahoreLogo, width: 61.w),
                SizedBox(width: 10.w),
                Column(
                  children: [
                    CText(
                      text: 'Racket Ranch Padel',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.kprimaryColor,
                    ),
                    Row(
                      children: [
                        Icon(Icons.near_me),
                        CText(text: '12km', fontSize: 12.sp),
                        SizedBox(width: 20.h),
                        Icon(Icons.location_on),
                        CText(text: 'Defence, Lahore', fontSize: 12.sp),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            CText(
              text:
                  '25% Discount on select timings (before 7.30pm & after 1.30am)',
              fontSize: 12.sp,
              maxLines: 2,
            ),
            const SizedBox(height: 16),

            // Social & Connect Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryIconButton(
                  text: 'Social',
                  onTap: () {},
                  width: 150,
                  icon: Icons.phone,
                  iconEnable: true,
                  color: AppColors.greyColor.withOpacity(0.5),
                ),
                PrimaryIconButton(
                  text: 'Connect',
                  onTap: () {},
                  width: 150,
                  icon: Icons.language,
                  iconEnable: true,
                  color: AppColors.greyColor.withOpacity(0.5),
                ),

                // OutlinedButton(onPressed: () {}, child: const Text("Social")),
                // OutlinedButton(onPressed: () {}, child: const Text("Connect")),
              ],
            ),

            const SizedBox(height: 20),

            // Premium Packages
            CText(
              text: 'Premium Packages',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.kprimaryColor,
            ),

            // Row(
            //   children: [
            //     Expanded(
            //       child: Container(
            //         padding: const EdgeInsets.all(12),
            //         decoration: BoxDecoration(
            //           color: Colors.amber.shade700,
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: const [
            //             Text(
            //               'GOLD - COURT\nPACKAGE 15 BOOKINGS',
            //               style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.white,
            //               ),
            //             ),
            //             SizedBox(height: 8),
            //             Text(
            //               'RS. 4000\nsave Rs. 500/booking\n90 MINS',
            //               style: TextStyle(color: Colors.white),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //     const SizedBox(width: 10),
            //     Expanded(
            //       child: Container(
            //         padding: const EdgeInsets.all(12),
            //         decoration: BoxDecoration(
            //           color: Colors.grey[300],
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         child: Column(
            //           children: const [
            //             Text(
            //               'SILVER PACKAGE\n(coming soon)',
            //               textAlign: TextAlign.center,
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            PremiumPackageSlider(
              imageList: controller.premiumPackageImages,
              currentIndex: controller.currentPackageIndex,
            ),
            const SizedBox(height: 24),
            CText(
              text: 'Opening Hours',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.kprimaryColor,
            ),
            SizedBox(height: 10.h),
            // Opening Hours
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Opening Time',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Closing Time',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.kprimaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField(
                              value: controller.openingTime.value,
                              isExpanded: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 6,
                                ),
                              ),
                              items: timeSlots
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) =>
                                  controller.openingTime.value = val!,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: DropdownButtonFormField(
                              value: controller.openingPeriod.value,
                              isExpanded: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 6,
                                ),
                              ),
                              items: periods
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) =>
                                  controller.openingPeriod.value = val!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 8),
                const Icon(Icons.chevron_right),
                const SizedBox(width: 8),

                // 🔹 Closing Time Group
                Expanded(
                  child: Obx(
                    () => Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.kprimaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField(
                              value: controller.closingTime.value,
                              isExpanded: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 6,
                                ),
                              ),
                              items: timeSlots
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) =>
                                  controller.closingTime.value = val!,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: DropdownButtonFormField(
                              value: controller.closingPeriod.value,
                              isExpanded: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 6,
                                ),
                              ),
                              items: periods
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) =>
                                  controller.closingPeriod.value = val!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Supported Sports
             Align(
              alignment: Alignment.centerLeft,
              child:  CText(
              text: 'Supported Sports',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.kprimaryColor,
               )  ),
            const SizedBox(height: 8),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller.supportedSports
                    .map(
                      (sport) => Row(
                        children: [
                          const Icon(Icons.sports),
                          const SizedBox(width: 8),
                          Text(sport),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),

            const SizedBox(height: 24),

            // Additional Services
            Align(
              alignment: Alignment.centerLeft,
              child:  CText(
              text: 'Additional Services',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.kprimaryColor,
               )  ),
            const SizedBox(height: 8),
            Obx(
              () => Wrap(
                spacing: 16,
                runSpacing: 8,
                children: controller.additionalServices
                    .map(
                      (service) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.check_circle_outline),
                          const SizedBox(width: 4),
                          Text(service),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 20,),

            SizedBox(
              width: double.infinity,
              child: PrimaryButton(text: 'Book', onTap: (){})),
            SizedBox(height: 80,),
          ],
        ),
      ),
      
    );
  }

  Widget sliderWidget(VenueBookingController controller) {
    return Column(
      children: [
        controller.bannerImages.isEmpty
            ? Center(child: SizedBox()) // Show loader when empty
            : SizedBox(
                width: double.infinity, // Ensures full width
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 170, // Adjust height if needed
                    viewportFraction:
                        0.9, // Slightly less than 1.0 to create spacing
                    enlargeCenterPage: false,
                    autoPlay: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      controller.currentBannerIndex.value = index;
                    },
                  ),
                  items: controller.bannerImages.map((banner) {
                    return Container(
                      width: double
                          .infinity, // Ensures the image covers full width
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 3,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          banner,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

        Obx(
          () => controller.bannerImages.isEmpty
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: AnimatedSmoothIndicator(
                    activeIndex: controller.currentBannerIndex.value,
                    count: controller.bannerImages.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: AppColors.primarybluecolor,
                      dotColor: Colors.grey.shade400,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
