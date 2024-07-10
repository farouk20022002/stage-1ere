import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/appbar/appbar.dart';
import 'package:fro9/common/widgets/appbar/tabbar.dart';
import 'package:fro9/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:fro9/common/widgets/layouts/grid_layout.dart';
import 'package:fro9/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:fro9/common/widgets/brands/t_brand_card.dart';
import 'package:fro9/common/widgets/texts/section_heading.dart';
import 'package:fro9/features/shop/screens/brand/all_brands.dart';
import 'package:fro9/features/shop/screens/store/widgets/category_tab.dart';
import 'package:fro9/utils/constants/colors.dart';
import 'package:fro9/utils/constants/sizes.dart';
import 'package:fro9/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class StoreScrenn extends StatelessWidget {
  const StoreScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCountericon(
              onPressed: () {},
              iconColor: Colors.black,
            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, index) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          const TSearchContainer(
                            padding: EdgeInsets.zero,
                            text: 'Search in Store',
                            showBorder: true,
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwSections,
                          ),
                          TSectionHeading(
                            title: "Featured Brands",
                            onPressed: () => Get.to(() => AllBrandsScreen()),
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems / 1.5,
                          ),
                          TGridLayout(
                              mainAxisExtent: 80,
                              itemCount: 4,
                              itemBuilder: (_, index) {
                                return const TBrandCard(
                                  showBorder: false,
                                );
                              }),
                          const SizedBox(
                            height: TSizes.xs,
                          )
                        ],
                      ),
                    ),
                    bottom: const TTabBar(
                      tab: [
                        Tab(
                          child: Text('Sports'),
                        ),
                        Tab(
                          child: Text('Electronics'),
                        ),
                        Tab(
                          child: Text('Furniture'),
                        ),
                        Tab(
                          child: Text('Clothes'),
                        ),
                        Tab(
                          child: Text('Cosmetics'),
                        )
                      ],
                    ))
              ];
            },
            body: const TabBarView(
              children: [
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
              ],
            )),
      ),
    );
  }
}
