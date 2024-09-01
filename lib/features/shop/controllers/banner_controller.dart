import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fro9/data/repositories/banners/banner_repository.dart';
import 'package:fro9/features/shop/models/banner_model.dart';
import 'package:fro9/utils/exceptions/firebase_exceptions.dart';
import 'package:fro9/utils/exceptions/platform_exceptions.dart';
import 'package:fro9/utils/popups/tloader.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final bannerRepo = Get.put(BannerRepository());
      final Banners = await bannerRepo.fetchBanners();
      this.banners.assignAll(Banners);
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
