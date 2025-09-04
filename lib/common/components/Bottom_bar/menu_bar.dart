import 'package:emall/common/components/Bottom_bar/bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class BarMenu extends StatelessWidget {
  final controller = Get.put(BarController());
  BarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
      child: Scaffold(
            body: controller.screens[controller.selectedIndex.value],
            bottomNavigationBar: NavigationBar(
              backgroundColor: Colors.white,
              height: 60,
              elevation: 1,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: controller.selectIndex,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Iconsax.home_1_copy, size: 30),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.shopping_cart_copy,  size: 30),
                  label: 'Store',
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.heart_copy,  size: 30),
                  label: 'Search',
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.user_copy,  size: 30),
                  label: 'Profile',
                ),
              ],
            ),
          ),
    ));
  }
}
