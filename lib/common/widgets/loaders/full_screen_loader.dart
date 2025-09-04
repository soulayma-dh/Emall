import 'package:emall/common/widgets/loaders/animationLoader..dart';
import 'package:emall/common/widgets/loaders/circularLoader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenLoader {
  
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, 
      barrierDismissible: false, 
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250), 
              AnimationLoader(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static void popUpCircular() {
    Get.defaultDialog(
      title: '',
      onWillPop: () async => false,
      content: const CircularLoader(),
      backgroundColor: Colors.transparent,
    );
  }

  
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); 
  }
}