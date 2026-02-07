import 'package:pinterest_clone/main_index.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    initialLocation: AppRouterPath.splash,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: AppRouterPath.splash,
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}
