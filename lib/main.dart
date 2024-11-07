import 'package:blog_app/core/route/route.dart';
import 'package:blog_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'core/constants/string_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: StringConstants.blogApp,
      theme: AppTheme.darkThemeMode,
      routerConfig: router,
    );
  }
}
