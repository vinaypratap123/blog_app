import 'package:blog_app/core/widgets/buttons/custom_button.dart';
import 'package:blog_app/core/widgets/common/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogoutConfirmationBottomSheet extends StatelessWidget {
  const LogoutConfirmationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppLocalizations.of(context)!.are_you_sure_you_want_to_logout,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const CustomSizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              btnName: AppLocalizations.of(context)!.cancel,
              isFilled: false,
              isOutlined: true,
              height: 40,
              width: 120,
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            CustomButton(
              btnName: AppLocalizations.of(context)!.logout,
              height: 40,
              width: 120,
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          ],
        ),
      ],
    );
  }
}
