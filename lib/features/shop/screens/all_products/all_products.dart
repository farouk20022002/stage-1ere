import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/appbar/appbar.dart';
import 'package:fro9/common/widgets/products/sortable/sortable_products.dart';
import 'package:fro9/features/shop/controllers/all_products_controller.dart';
import 'package:fro9/features/shop/models/product_model.dart';
import 'package:fro9/utils/constants/sizes.dart';
import 'package:fro9/utils/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: TAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot);
                if (widget != null) return widget;
                final products = snapshot.data!;
                return TSortableProducts(products: products);
              }),
        ),
      ),
    );
  }
}
