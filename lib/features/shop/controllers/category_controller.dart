import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:fro9/data/repositories/categories/category_repository.dart';
import 'package:fro9/features/shop/models/category_model.dart';
import 'package:fro9/utils/exceptions/firebase_exceptions.dart';
import 'package:fro9/utils/exceptions/platform_exceptions.dart';
import 'package:fro9/utils/popups/tloader.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final _categoryRepository = Get.put(CategoryRepository());
  final isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;

  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final Categories = await _categoryRepository.getAllCategories();
      allCategories.assignAll(Categories);
      featuredCategories.assignAll(allCategories
          .where(
              (category) => category.isFeatured && category.parentId!.isEmpty)
          .take(8)
          .toList());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap ', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
