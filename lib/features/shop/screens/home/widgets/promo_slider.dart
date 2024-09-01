import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:fro9/features/shop/controllers/banner_controller.dart';
import 'package:fro9/features/shop/controllers/home_controller.dart';
import 'package:fro9/utils/constants/colors.dart';
import 'package:fro9/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/images/t_rounded_image.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () => Column(
        children: [
          CarouselSlider(
            items: controller.banners
                .map((url) => TRoundedImage(
                      imageURl: url.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(url.targetScreen),
                    ))
                .toList(),
            options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index)),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < controller.banners.length; i++)
                  TCircularContainer(
                    backgroundColor: controller.carousalCurrentIndex >= i
                        ? TColors.primary
                        : TColors.grey,
                    width: 20,
                    height: 6,
                    margin: const EdgeInsets.only(right: 10),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
