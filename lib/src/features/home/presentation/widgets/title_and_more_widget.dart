import 'package:e_learning/generated/l10n.dart';

import '../../../../core/utils/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

Row buildTitleAndMore(BuildContext context, String title) {
  return Row(
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
              height: .8,
            ),
      ),
      const Spacer(),
      InkWell(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).see_all,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                    height: .8,
                  ),
            ),
            horizentalGab(val: 5.0),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15.0,
              // color: Colors.white,
            ),
            horizentalGab(),
          ],
        ),
      )
    ],
  );
}
