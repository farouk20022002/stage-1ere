import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/layouts/grid_layout.dart';
import 'package:fro9/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:fro9/features/shop/controllers/all_products_controller.dart';
import 'package:fro9/features/shop/models/product_model.dart';
import 'package:fro9/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popular'
          ]
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Obx(
          () => TGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) => TProductCardVertical(
                    product: controller.products[index],
                  )),
        )
      ],
    );
  }
}
