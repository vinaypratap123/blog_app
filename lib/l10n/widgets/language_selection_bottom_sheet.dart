import 'package:blog_app/core/utils/shared_preferences.dart';
import 'package:blog_app/l10n/bloc/app_localization_bloc.dart';
import 'package:blog_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class LanguageSelectionBottomSheet extends StatefulWidget {
  const LanguageSelectionBottomSheet({super.key});

  @override
  LanguageSelectionBottomSheetState createState() =>
      LanguageSelectionBottomSheetState();
}

class LanguageSelectionBottomSheetState
    extends State<LanguageSelectionBottomSheet> {
  String _selectedLanguage = 'en';

  /// init method
  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  /// fetch the selected language
  Future<void> _loadSelectedLanguage() async {
    _selectedLanguage = SharedPreferencesHandler.getLanguage() ?? 'en';

    setState(() {});
  }

  /// select the language
  void _onLanguageSelected(String language) {
    setState(() {
      _selectedLanguage = language;
    });

    if (_selectedLanguage == 'en') {
      context
          .read<AppLocalizationBloc>()
          .add(ChangeAppLocalization(selectedLocale: supportedLocale[0]));
    } else {
      context
          .read<AppLocalizationBloc>()
          .add(ChangeAppLocalization(selectedLocale: supportedLocale[1]));
    }

    GoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.select_language,
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
        ListTile(
          title: Text(AppLocalizations.of(context)!.english),
          leading: Radio<String>(
            value: 'en',
            groupValue: _selectedLanguage,
            onChanged: (value) {
              if (value != null) _onLanguageSelected(value);
            },
          ),
          onTap: () {
            _onLanguageSelected('en');
          },
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.hindi),
          leading: Radio<String>(
            value: 'hi',
            groupValue: _selectedLanguage,
            onChanged: (value) {
              if (value != null) _onLanguageSelected(value);
            },
          ),
          onTap: () {
            _onLanguageSelected('hi');
          },
        ),
      ],
    );
  }
}
