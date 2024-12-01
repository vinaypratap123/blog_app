import 'package:blog_app/core/constants/string_constants.dart';
import 'package:blog_app/core/route/route.dart';
import 'package:blog_app/core/theme/theme_cubit.dart';
import 'package:blog_app/core/utils/shared_preferences.dart';
import 'package:blog_app/dependency_injection.dart';
import 'package:blog_app/feature/authentication/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/l10n/bloc/app_localization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHandler.init();
  await init();

  runApp(
    MultiBlocProvider(
      providers: [
        ///....theme cubit
        BlocProvider<ThemeCubit>(
          create: (context) => sl<ThemeCubit>(),
        ),

        ///....app localization bloc
        BlocProvider<AppLocalizationBloc>(
          create: (context) => AppLocalizationBloc()..add(GetLocale()),
        ),

        ///.... auth bloc
        BlocProvider(
          create: (context) => sl<AuthBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state;
    return BlocBuilder<AppLocalizationBloc, AppLocalizationState>(
      buildWhen: (previous, current) =>
          previous.selectedLocale != current.selectedLocale,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          key: ValueKey(theme),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: StringConstants.blogApp,
            locale: state.selectedLocale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            theme: theme,
            routerConfig: router,
          ),
        );
      },
    );
  }
}
