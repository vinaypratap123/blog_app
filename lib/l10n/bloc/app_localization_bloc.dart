import 'dart:ui';
import 'package:blog_app/core/utils/shared_preferences.dart';
import 'package:blog_app/l10n/l10n.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'app_localization_event.dart';
part 'app_localization_state.dart';

class AppLocalizationBloc
    extends Bloc<AppLocalizationEvent, AppLocalizationState> {
  AppLocalizationBloc() : super(AppLocalizationState()) {
    on<ChangeAppLocalization>(onLanguageChange);
    on<GetLocale>(onGetLocale);
  }
  onLanguageChange(
    ChangeAppLocalization event,
    Emitter<AppLocalizationState> emit,
  ) {
    final String languageCode = event.selectedLocale.languageCode;
    SharedPreferencesHandler.setLanguage(languageCode);
    emit(state.copyWith(selectedLocale: event.selectedLocale));
  }

  onGetLocale(
    GetLocale event,
    Emitter<AppLocalizationState> emit,
  ) async {
    String language = SharedPreferencesHandler.getLanguage() ?? 'en';
    Locale locale = supportedLocale[0];
    if (language == 'hi') {
      locale = supportedLocale[1];
    }

    emit(state.copyWith(selectedLocale: locale));
  }
}
