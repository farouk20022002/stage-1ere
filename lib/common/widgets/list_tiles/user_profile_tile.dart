import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/images/t_circular_image.dart';
import 'package:fro9/features/personalization/controllers/user_controller.dart';
import 'package:fro9/utils/constants/colors.dart';
import 'package:fro9/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/personalization/screens/profile/profile.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const TCircularImage(
        image: TImages.user,
        widht: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
          onPressed: () => Get.to(() => ProfileScreen()),
          icon: const Icon(
            Iconsax.edit,
            color: TColors.white,
          )),
    );
  }
}
