import 'package:emall/common/widgets/roundedImage.dart';
import 'package:emall/features/home/controller/home_controller.dart';
import 'package:emall/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PromoSlider extends StatelessWidget {
  final List<String> banners;
  final controller = Get.put(HomeController());
  PromoSlider({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          
          options: CarouselOptions(
            viewportFraction: 0.95,
            onPageChanged: (index, _) {
              controller.updatePageIndicator(index);
            },
          ),
          items: banners.map((imageUrl) {
            return Container(
              child: RoundedImage(
                  image: imageUrl,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: DeviceUtils.getScreenWidth(context)  ,
                  onPressed: () {}),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Center(
          child: Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  banners.length,
                  (index) => Container(
                    width: 10,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: controller.carouselCurrentIndex.value == index
                          ? const Color.fromARGB(255, 2, 42, 75)
                          : Colors.grey,
                    ),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
