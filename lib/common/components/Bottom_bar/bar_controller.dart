import 'package:emall/features/home/view/home_page.dart';
import 'package:emall/screens/profile_page.dart';
import 'package:emall/screens/store_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BarController extends GetxController {
  var selectedIndex = 0.obs;

  void selectIndex(int index) {
    selectedIndex.value = index;
  }

  List<Widget> screens = [
    HomePage(),
     StorePage(),
    Container(color: Colors.blue, child: Center(child: Text("Settings"))),
    ProfilePage(),
   
  ];
}
