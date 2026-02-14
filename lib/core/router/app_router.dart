import 'package:pinterest_clone/features/home/presentation/screens/home_screen.dart';
import 'package:pinterest_clone/features/onboarding/presentation/screens/country/my_country_screen.dart';
import 'package:pinterest_clone/features/onboarding/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:pinterest_clone/features/search/presentation/screens/search_flow_screen.dart';
import 'package:pinterest_clone/main_index.dart';
import 'package:pinterest_clone/navigation/main_tabs_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    initialLocation: AppRouterPath.tabs,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: AppRouterPath.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRouterPath.onBoarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRouterPath.country,
        builder: (context, state) => const MyCountryScreen(),
      ),
      GoRoute(
        path: AppRouterPath.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRouterPath.search,
        builder: (context, state) => const SearchFlowScreen(),
      ),
      GoRoute(
        path: AppRouterPath.tabs,
        builder: (context, state) => const MainTabsScreen(),
      ),
    ],
  );
}
