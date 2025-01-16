import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../src/providers/auth/auth_provider.dart';
import '../../src/views/home/home_screen.dart';
import '../../src/views/login/login_screen.dart';
import '../../src/views/more/views/more_screen.dart';
import '../../src/views/more/views/settings/settings_export.dart';
import '../../src/views/social/views/social_screen.dart';
import '../../src/views/splash/splash_screen.dart';
import '../../src/views/statistics/views/statistics_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();
bool firstRun = true;

// GoRouter 설정
final goRouterProvider = Provider<GoRouter>((ref) {
  final isLoggedIn = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/splash',
    redirect: (context, state) {
      if (firstRun && state.fullPath == '/splash') {
        firstRun = false;
        return null;
      }

      if (state.fullPath == '/login' && isLoggedIn) {
        return '/';
      }

      if (!isLoggedIn) {
        return '/splash';
      }

      if (!firstRun && state.fullPath == '/splash') {
        return '/';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: '/splash',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        path: '/social',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const SocialScreen(),
        ),
      ),
      GoRoute(
        path: '/statistics',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const StatisticsScreen(),
        ),
      ),
      GoRoute(
        path: '/more',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const MoreScreen(),
        ),
        routes: [
          GoRoute(
              path: 'settings',
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: const SettingsScreen(),
                  ),
              routes: [
                GoRoute(
                  path: 'language',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: const SelectLanguageScreen(),
                  ),
                ),
                GoRoute(
                  path: 'country',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: const SelectCountryScreen(),
                  ),
                ),
                GoRoute(
                  path: 'group',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: const SelectGroupScreen(),
                  ),
                ),
              ])
        ],
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const LoginScreen(),
        ),
      ),
    ],

    // errorBuilder: (context, state) => PageNotFound(
    //   errMsg: state.error.toString(),
    // ),
  );
});

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
