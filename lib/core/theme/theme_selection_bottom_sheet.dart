import 'package:blog_app/core/constants/app_constants.dart';
import 'package:blog_app/core/theme/theme_cubit.dart';
import 'package:blog_app/core/widgets/common/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeSelectionBottomSheet extends StatelessWidget {
  const ThemeSelectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.select_theme,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              InkWell(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: const Icon(Icons.close_outlined),
              ),
            ],
          ),
        ),
        const Divider(),
        const CustomSizedBox(
          height: 15,
        ),
        ListTile(
          leading: Icon(
            Icons.light_mode,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          title: Text(
            AppLocalizations.of(context)!.light_theme,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          onTap: () {
            GoRouter.of(context).pop();
            themeCubit.toggleTheme(ThemeModeEnum.light);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.dark_mode,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          title: Text(
            AppLocalizations.of(context)!.dark_theme,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          onTap: () {
            GoRouter.of(context).pop();
            themeCubit.toggleTheme(ThemeModeEnum.dark);
          },
        ),
      ],
    );
  }
}
