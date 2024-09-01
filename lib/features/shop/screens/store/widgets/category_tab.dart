import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/brands/brand_show_case.dart';
import 'package:fro9/common/widgets/layouts/grid_layout.dart';
import 'package:fro9/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:fro9/common/widgets/texts/section_heading.dart';
import 'package:fro9/features/shop/models/category_model.dart';
import 'package:fro9/features/shop/models/product_model.dart';
import 'package:fro9/utils/constants/image_strings.dart';
import 'package:fro9/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TBrandShowCase(
              images: [
                TImages.productImage1,
                TImages.productImage3,
                TImages.productImage2
              ],
            ),
            const TBrandShowCase(
              images: [
                TImages.productImage1,
                TImages.productImage3,
                TImages.productImage2
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TSectionHeading(
              title: 'You might like',
              showActionButton: true,
              onPressed: () {},
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) {
                  return TProductCardVertical(
                    product: ProductModel.empty(),
                  );
                })
          ],
        ),
      ),
    );
  }
}
