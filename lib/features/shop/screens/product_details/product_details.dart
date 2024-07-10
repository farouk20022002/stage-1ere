import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/texts/section_heading.dart';
import 'package:fro9/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:fro9/features/shop/screens/product_details/widgets/product_atributes.dart';
import 'package:fro9/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:fro9/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:fro9/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:fro9/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../personalization/screens/profile/widgets/product_image_product_slider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: TBottomAddToCart(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TProductImageSlider(),
              Padding(
                padding: EdgeInsets.only(
                    right: TSizes.defaultSpace,
                    left: TSizes.defaultSpace,
                    bottom: TSizes.defaultSpace),
                child: Column(
                  children: [
                    TRatingAndShare(),
                    TProductMetaData(),
                    ProductAttributes(),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Checkout'))),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    TSectionHeading(
                      title: 'Description',
                      showActionButton: false,
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    ReadMoreText(
                      "hedheya sabat kesa7 yeser tnajem tejry byh 9999 Km w maysirlou chy w ken sarlou ija badlou lkjkjkj kjlklkj kjjlk jkj kjk jk jhu hyg v t vg  hv vgvhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh gv gj gvj v h vhv hvh  jh j hedheya sabat kesa7 yeser tnajem tejry byh 9999 Km w maysirlou chy w ken sarlou ija badlou lkjkjkj kjlklkj kjjlk jkj kjk jk jhu hyg v t vg  hv vgvhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh gv gj gvj v h vhv hvh  jh j hedheya sabat kesa7 yeser tnajem tejry byh 9999 Km w maysirlou chy w ken sarlou ija badlou lkjkjkj kjlklkj kjjlk jkj kjk jk jhu hyg v t vg  hv vgvhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh gv gj gvj v h vhv hvh  jh jhedheya sabat kesa7 yeser tnajem tejry byh 9999 Km w maysirlou chy w ken sarlou ija badlou lkjkjkj kjlklkj kjjlk jkj kjk jk jhu hyg v t vg  hv vgvhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh gv gj gvj v h vhv hvh  jh j hedheya sabat kesa7 yeser tnajem tejry byh 9999 Km w maysirlou chy w ken sarlou ija badlou lkjkjkj kjlklkj kjjlk jkj kjk jk jhu hyg v t vg  hv vgvhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh gv gj gvj v h vhv hvh  jh j hedheya sabat kesa7 yeser tnajem tejry byh 9999 Km w maysirlou chy w ken sarlou ija badlou lkjkjkj kjlklkj kjjlk jkj kjk jk jhu hyg v t vg  hv vgvhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh gv gj gvj v h vhv hvh  jh j hedheya sabat kesa7 yeser tnajem tejry byh 9999 Km w maysirlou chy w ken sarlou ija badlou lkjkjkj kjlklkj kjjlk jkj kjk jk jhu hyg v t vg  hv vgvhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh gv gj gvj v h vhv hvh  jh j hedheya sabat kesa7 yeser tnajem tejry byh 9999 Km w maysirlou chy w ken sarlou ija badlou lkjkjkj kjlklkj kjjlk jkj kjk jk jhu hyg v t vg  hv vgvhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh gv gj gvj v h vhv hvh  jh jhedheya sabat kesa7 yeser tnajem tejry byh 9999 Km w maysirlou chy w ken sarlou ija badlou lkjkjkj kjlklkj kjjlk jkj kjk jk jhu hyg v t vg  hv vgvhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh gv gj gvj v h vhv hvh  jh j ",
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show More',
                      trimExpandedText: 'Less',
                      moreStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      lessStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Row(
                      children: [
                        TSectionHeading(
                          showActionButton: false,
                          title: 'Reviews(200)',
                          onPressed: () {},
                        ),
                        IconButton(
                            onPressed: () =>
                                Get.to(() => ProductReviewScreen()),
                            icon: Icon(
                              Iconsax.arrow_right_3,
                              size: 18,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
