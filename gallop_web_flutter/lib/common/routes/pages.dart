import 'package:fluent_ui/fluent_ui.dart';
import 'package:gallop_web_flutter/common/routes/name.dart';
import 'package:gallop_web_flutter/pages/home/home.dart';
import 'package:gallop_web_flutter/pages/login/login.dart';
import 'package:gallop_web_flutter/pages/my_order/my_order.dart';
import 'package:gallop_web_flutter/pages/navigation.dart';
import 'package:gallop_web_flutter/pages/profile/profile.dart';
import 'package:gallop_web_flutter/pages/rental/rental.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(navigatorKey: rootNavigatorKey, routes: [
  ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return NavigationPage(
          shellContext: _shellNavigatorKey.currentContext,
          child: child,
        );
      },
      routes: [
        /// Home
        GoRoute(path: RouteName.login, builder: (context, state) => const LoginPage()),

        /// Home
        GoRoute(path: RouteName.home, builder: (context, state) => const HomePage()),

        /// rental
        GoRoute(
            path: RouteName.rental, builder: (context, state) => const RentalPage()),

        /// profile
        GoRoute(
            path: RouteName.profile, builder: (context, state) => const ProfilePage()),

        /// myOrder
        GoRoute(
            path: RouteName.myOrder, builder: (context, state) => const MyOrderPage()),
      ])
]);
