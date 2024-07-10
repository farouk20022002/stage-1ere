import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/texts/section_heading.dart';
import 'package:fro9/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Changes',
          onPressed: () {},
        ),
        Text(
          'SCSI ECOMMERCE',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          children: [
            Icon(
              Icons.phone,
              color: Colors.grey,
              size: 16,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '+216 98 655 524',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Row(
          children: [
            Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 16,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Expanded(
                child: Text(
              'Kalaa Kbira,Sousse,Tunisie',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ))
          ],
        ),
      ],
    );
  }
}
