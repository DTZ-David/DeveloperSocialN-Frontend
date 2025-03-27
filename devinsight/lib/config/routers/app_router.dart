import 'package:devinsight/ui/login/screens/loginScreen.dart';
import 'package:devinsight/ui/login/screens/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRouter.initial,
    routes: [
      GoRoute(
        path: AppRouter.initial,
        name: AppRouter.initial,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRouter.registerUser,
        name: AppRouter.registerUser,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRouter.login,
        name: AppRouter.login,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
});

final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>();
});

sealed class AppRouter {
  static const initial = '/';
  static const registerUser = '/registerUser';
  static const login = '/login';
}
