import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emall/data/models/user.dart';
import 'package:emall/features/authentification/repository/authentification_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } catch (e) {
      throw 'Something went wrong. Please try again $e';
    }
  }

  /// Function to fetch user data from firebase
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthentificationRepository.instance.currentUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromDocSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code);
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to update user data in firebase
  Future<void> updateUser(UserModel updatedUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code);
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

/// Function to update any field in specific user collection 
Future<void> updateSingleField(Map<String , dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthentificationRepository.instance.currentUser!.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code);
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to remove user collection 
Future<void> removeUser(String userId) async {
    try {
      await _db
          .collection("Users")
          .doc(userId)
          .delete();
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code);
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

/// Function to upload any image
Future<String> uploadImage(String path, XFile image) async {
   try {
    final ref = FirebaseStorage.instance.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    return url ;
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code);
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
}
}
