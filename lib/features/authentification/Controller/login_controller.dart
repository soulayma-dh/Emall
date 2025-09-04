import 'package:emall/features/authentification/repository/authentification_repository.dart';
import 'package:emall/helpers/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

//Variables
  var isPasswordHidden = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  void PasswordHidden() => isPasswordHidden.value = !isPasswordHidden.value;

  /// [EmailAndPasswordLogin]
  Future<void> emailAndPasswordLogin() async {
    try {
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        Get.snackbar('Error Connection', 'No Internet Connection');
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) return;

      // Login user using EMail & Password Authentication
      await AuthentificationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      AuthentificationRepository.instance.screenRedirect();
    } catch (e) {
      Get.snackbar('Oh Snap', e.toString());
    }
  }
}
