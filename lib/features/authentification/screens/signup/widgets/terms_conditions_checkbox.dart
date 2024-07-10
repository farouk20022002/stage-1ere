import 'package:flutter/material.dart';
import 'package:fro9/features/authentification/screens/signup/widgets/signup_form.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TTermsAndConditionBox extends StatefulWidget {
  const TTermsAndConditionBox({
    super.key,
  });
  static bool privacyPolicy = true;

  @override
  State<TTermsAndConditionBox> createState() => _TTermsAndConditionBoxState();
}

class _TTermsAndConditionBoxState extends State<TTermsAndConditionBox> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
                value: TTermsAndConditionBox.privacyPolicy,
                onChanged: (value) {
                  setState(() {
                    TTermsAndConditionBox.privacyPolicy =
                        !TTermsAndConditionBox.privacyPolicy;
                  });
                })),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${TTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${TTexts.privacyPolicy} ',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: dark ? Colors.white : TColors.primary)),
          TextSpan(
              text: '${TTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: TTexts.termsOfUse,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: dark ? Colors.white : TColors.primary))
        ]))
      ],
    );
  }
}
