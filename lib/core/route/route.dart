import 'package:blog_app/core/route/route_constants.dart';
import 'package:blog_app/feature/authentication/presentation/screens/login_screen.dart';
import 'package:blog_app/feature/authentication/presentation/screens/signup_screen.dart';
import 'package:blog_app/feature/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
String setInitialLocation() {
  return '/';
}

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: setInitialLocation(),
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: RouteConstants.loginScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/signupScreen',
      name: RouteConstants.signupScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SignupScreen();
      },
    ),
    GoRoute(
      path: '/homeScreen',
      name: RouteConstants.homeScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
  ],
);
