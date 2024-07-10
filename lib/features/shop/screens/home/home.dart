import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/custom_shapes/containers/search_container.dart';

import 'package:fro9/common/widgets/layouts/grid_layout.dart';
import 'package:fro9/common/widgets/products/product_card/product_card_vertical.dart';

import 'package:fro9/common/widgets/texts/section_heading.dart';
import 'package:fro9/features/shop/screens/all_products/all_products.dart';
import 'package:fro9/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:fro9/features/shop/screens/home/widgets/home_categories.dart';
import 'package:fro9/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:fro9/utils/constants/image_strings.dart';
import 'package:fro9/utils/constants/sizes.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header-container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        const TPrimaryHeaderController(
            child: Column(
          children: [
            THomeBar(),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            TSearchContainer(
              text: 'Search in Store',
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(
                    showActionButton: false,
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  THomeCategories(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            )
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            const TPromoSlider(
              banners: [
                TImages.promoBanner3,
                TImages.promoBanner2,
                TImages.promoBanner1,
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            TSectionHeading(
              title: "Popular Products",
              onPressed: () => Get.to(() => AllProducts()),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TGridLayout(
              itemBuilder: (_, index) => const TProductCardVertical(),
              itemCount: 4,
            ),
          ]),
        )
      ],
    )));
  }
}
