import 'package:devinsight/ui/login/screens/auth/loginScreen.dart';
import 'package:devinsight/ui/login/screens/auth/registerScreen.dart';
import 'package:devinsight/ui/login/screens/onboard/onboardScreen1.dart';
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
      GoRoute(
        path: AppRouter.onboard1,
        name: AppRouter.onboard1,
        builder: (context, state) => const OnboardingPage1(),
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
  static const onboard1 = '/onboard1';
}
