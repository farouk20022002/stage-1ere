import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:fro9/data/services/cloud_storage/firebase_storage_service.dart';
import 'package:fro9/features/shop/models/banner_model.dart';
import 'package:fro9/utils/exceptions/firebase_exceptions.dart';
import 'package:fro9/utils/exceptions/format_exceptions.dart';
import 'package:fro9/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      return result.docs.map((e) => BannerModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong : ${e}";
    }
  }

  Future<void> uploadDummyData(List<BannerModel> categories) async {
    try {
      int x = 1;
      final storage = Get.put(TFirebaseStorageService());
      for (var category in categories) {
        final file = await storage.getImageDataFromAssets(category.imageUrl);
        final url =
            await storage.uploadImageData('Banners', file, category.imageUrl);
        category.imageUrl = url;
        print("7atina l url ${url} f blasetha");
        await _db.collection("Banners").doc('${x}').set(category.toJson());
        print("hethy me lezemhech todhher");
        x++;
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again:${e}';
    }
  }
}
