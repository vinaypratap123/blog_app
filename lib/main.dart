import 'package:blog_app/core/route/route.dart';
import 'package:blog_app/core/theme/app_theme.dart';
import 'package:blog_app/core/theme/theme_cubit.dart';
import 'package:blog_app/dependency_injection.dart';
import 'package:blog_app/feature/authentication/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/string_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(
    MultiBlocProvider(
      providers: [
        ///....theme cubit
        BlocProvider<ThemeCubit>(
          create: (context) => sl<ThemeCubit>(),
        ),

        ///.... auth bloc
        // BlocProvider(
        //   create: (context) => sl<AuthBloc>(),
        // ),

        ///.... another bloc
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: StringConstants.blogApp,
          theme: theme,
          routerConfig: router,
        );
      },
    );
  }
}
