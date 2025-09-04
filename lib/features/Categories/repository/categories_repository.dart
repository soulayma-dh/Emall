import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emall/features/Categories/model/category.dart';
import 'package:get/get.dart';

class CategoriesRepository extends GetxController {
  static CategoriesRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

/// Get all Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code);
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
