import 'package:voco/export/view_exports.dart';
import 'package:voco/router/routes.dart';

import '../export/package_exports.dart';
import '../export/service_exports.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: Routes.login.path,
    routes: [
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        builder: (context, state) => const HomeView(),
      ),
    ],
    redirect: (context, state) {
      if (locator<Api>().token.isEmpty) {
        return Routes.login.path;
      }
      return Routes.home.path;
    });
