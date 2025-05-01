import 'package:devinsight/ui/home/views/messageProfile.dart';
import 'package:devinsight/ui/login/screens/loginScreen.dart';
import 'package:devinsight/ui/login/screens/registerScreen.dart';
import 'package:devinsight/ui/login/views/onboardScreen1.dart';
import 'package:devinsight/ui/login/views/onboardScreen2.dart';
import 'package:devinsight/ui/login/views/onboardScreen3.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/ui/home/screens/main_screen.dart';

import '../../ui/home/views/explorer.dart';
import '../../ui/home/views/home.dart';
import '../../ui/home/views/profile.dart';
import '../../ui/home/views/publications.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRouter.login,
    routes: [
      GoRoute(
        path: AppRouter.login,
        name: AppRouter.login,
        // CHANGE THIS AGAIN TO LOGIN SCREEN WHENEVER YOURE DONE WITH YOUR TASKS
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRouter.registerUser,
        name: AppRouter.registerUser,
        builder: (context, state) => const RegisterScreen(),
      ),
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
      GoRoute(
        path: AppRouter.message,
        name: AppRouter.message,
        builder: (context, state) => const MessageProfile(),
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
  static const message = '/message';
}
