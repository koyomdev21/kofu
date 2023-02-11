import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:kofu/src/features/authentication/signin/presentation/screens/sign_in_screen_base.dart';
import 'package:kofu/src/features/authentication/signup/presentation/screens/sign_up_screen_base.dart';
import 'package:kofu/src/features/profile/presentation/screens/profile_screen_base.dart';
import 'package:kofu/src/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:kofu/src/features/search/presentation/screens/search_screen_base.dart';
import 'package:kofu/src/features/order/presentation/screens/order_screen_base.dart';
import 'package:kofu/src/features/cart/presentation/screens/cart_screen_base.dart';
import 'package:kofu/src/features/home/presentation/screens/home_screen_base.dart';
import 'package:kofu/src/utils/app_preferences.dart';
import 'package:kofu/src/routing/not_found_screen.dart';

enum AppRoute {
  root,
  home,
  cart,
  order,
  profile,
  signIn,
  signUp,
  search,
}

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(appPreferencesProvider);
  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      final isLoggedIn = await notifier.isLoggedIn();
      if (state.location == '/profile') {
        if (!isLoggedIn) {
          return '/signIn';
        } else {
          return '/profile';
        }
      }
      if (state.location == '/signIn') {
        if (isLoggedIn) {
          return '/profile';
        } else {
          return '/signIn';
        }
      }
      return null;
    },
    refreshListenable: notifier,
    routes: [
      GoRoute(
        path: '/home',
        name: AppRoute.root.name,
        builder: (context, state) => const HomeScreenBase(),
      ),
      GoRoute(
        path: '/search',
        name: AppRoute.search.name,
        builder: (context, state) => const SearchScreenBase(),
      ),
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        builder: (context, state) => const SignInScreenBase(),
        routes: [
          GoRoute(
            path: 'signUp',
            name: AppRoute.signUp.name,
            builder: (context, state) => const SignUpScreenBase(),
          )
        ],
      ),
      // GoRoute(
      //   path: '/profile',
      //   name: AppRoute.profile.name,
      //   builder: (context, state) => const ProfileScreenBase(),
      // ),
      ShellRoute(
          navigatorKey: _shellNavigator,
          builder: (context, state, child) => DashboardScreen(
                key: state.pageKey,
                child: child,
              ),
          routes: [
            GoRoute(
              path: '/',
              name: AppRoute.home.name,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: HomeScreenBase(
                    key: state.pageKey,
                  ),
                );
              },
            ),
            GoRoute(
              path: '/cart',
              name: AppRoute.cart.name,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: CartScreenBase(
                    key: state.pageKey,
                  ),
                );
              },
            ),
            GoRoute(
              path: '/order',
              name: AppRoute.order.name,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: OrderScreenBase(
                    key: state.pageKey,
                  ),
                );
              },
            ),
            GoRoute(
              parentNavigatorKey: _shellNavigator,
              path: '/profile',
              name: AppRoute.profile.name,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: ProfileScreenBase(
                    key: state.pageKey,
                  ),
                );
              },
            ),
          ]),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
});
