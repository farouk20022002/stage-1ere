import 'package:fro9/data/repositories/product/product_repository.dart';
import 'package:fro9/features/shop/enums/enums.dart';
import 'package:fro9/features/shop/models/product_model.dart';
import 'package:fro9/utils/popups/tloader.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());
  final isLoading = false.obs;
  @override
  void onInit() {
    fetchFeaturedProduct();
    super.onInit();
  }

  void fetchFeaturedProduct() async {
    try {
      isLoading.value = true;
      final products = await productRepository.getFeaturedProducts();
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap! ', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProduct() async {
    try {
      final products = await productRepository.getFeaturedProducts();
      return products;
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap! ', message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var variation in product.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
