import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:fro9/features/shop/controllers/category_controller.dart';
import 'package:fro9/features/shop/screens/sub_category/sub_categories.dart';
import 'package:fro9/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Obx(
      () {
        if (controller.featuredCategories.isEmpty) {
          return Center(
              child: Text(
            'No Data Found',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ));
        }
        return SizedBox(
          height: 80,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = controller.featuredCategories[index];
              return TVerticalImageText(
                image: category.image,
                isNetworkImage: true,
                title: category.name,
                onTap: () => Get.to(() => SubCategoriesScreen()),
              );
            },
          ),
        );
      },
    );
  }
}
