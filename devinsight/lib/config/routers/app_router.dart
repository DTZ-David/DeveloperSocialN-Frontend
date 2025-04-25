import 'package:devinsight/ui/views/root/explorer.dart';
import 'package:devinsight/ui/views/root/home.dart';
import 'package:devinsight/ui/views/root/profile.dart';
import 'package:devinsight/ui/screens/auth/loginScreen.dart';
import 'package:devinsight/ui/views/root/publications.dart';
import 'package:devinsight/ui/screens/auth/registerScreen.dart';
import 'package:devinsight/ui/views/auth/onboardScreen1.dart';
import 'package:devinsight/ui/views/auth/onboardScreen2.dart';
import 'package:devinsight/ui/views/auth/onboardScreen3.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/ui/screens/root/main_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRouter.initial,
    routes: [
      GoRoute(
        path: AppRouter.initial,
        name: AppRouter.initial,
        builder: (context, state) => const MainScreen(),
        routes: [
          GoRoute(
            path: AppRouter.home,
            name: AppRouter.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: AppRouter.publications,
            name: AppRouter.publications,
            builder: (context, state) => const Publications(),
          ),
          GoRoute(
            path: AppRouter.explorer,
            name: AppRouter.explorer,
            builder: (context, state) => const ExplorerPage(),
          ),
          GoRoute(
            path: AppRouter.profile,
            name: AppRouter.profile,
            builder: (context, state) => const Profile(),
          ),
        ],
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
      GoRoute(
        path: AppRouter.onboard2,
        name: AppRouter.onboard2,
        builder: (context, state) => const OnboardingPage2(),
      ),
      GoRoute(
        path: AppRouter.onboard3,
        name: AppRouter.onboard3,
        builder: (context, state) => const OnboardingPage3(),
      ),
    ],
  );
});

final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>();
});

sealed class AppRouter {
  static const initial = '/main';
  static const registerUser = '/registerUser';
  static const login = '/login';
  static const onboard1 = '/onboard1';
  static const onboard2 = '/onboard2';
  static const onboard3 = '/onboard3';
  static const home = '/home';
  static const publications = '/publications';
  static const explorer = '/explorer';
  static const profile = '/profile';
}
