import 'package:emall/features/authentification/repository/authentification_repository.dart';
import 'package:emall/data/repositories/user_repository.dart';
import 'package:emall/features/authentification/Views/login_page.dart';
import 'package:emall/helpers/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/user.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final email = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();

  /// Fonction d'inscription
  void signup() async {
    try {
      // Vérifier la connexion internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        Get.snackbar("Error", "No internet connection.");
        return;
      }

      // Validation du formulaire
      if (!signupFormKey.currentState!.validate()) return;

      //Sign up
      final userCredential = await AuthentificationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
      );
      final userController = Get.put(UserRepository());
      await userController.saveUserRecord(newUser);

      Get.snackbar("Success", "Account created successfully!");
      Get.to(() => LoginPage());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }



  
}
