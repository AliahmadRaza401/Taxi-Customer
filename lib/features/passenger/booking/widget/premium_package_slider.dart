import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PremiumPackageSlider extends StatelessWidget {
  final List<String> imageList;
  final RxInt currentIndex;

  const PremiumPackageSlider({
    Key? key,
    required this.imageList,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        imageList.isEmpty
            ? const SizedBox()
            : SizedBox(
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 170,
                    viewportFraction: 0.85,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    onPageChanged: (index, reason) {
                      currentIndex.value = index;
                    },
                  ),
                  items: imageList.map((img) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          img,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
        const SizedBox(height: 8),
        Obx(
          () => imageList.isEmpty
              ? const SizedBox()
              : AnimatedSmoothIndicator(
                  activeIndex: currentIndex.value,
                  count: imageList.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Colors.green,
                    dotColor: Colors.grey.shade400,
                  ),
                ),
        ),
      ],
    );
  }
}
