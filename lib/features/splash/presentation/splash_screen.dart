import 'dart:async';
import 'package:pinterest_clone/core/constants/app_strings.dart';
import 'package:pinterest_clone/core/services/shared_pref_service.dart';
import 'package:pinterest_clone/main_index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 1), () {
        final isLoggedIn = SharedPrefService.getBool(AppStrings.isLoggedIn);
        final isOnboarded = SharedPrefService.getBool(AppStrings.isOnboarded);
        if (true) {
          if (isOnboarded != null && isOnboarded) {
            context.go(AppRouterPath.tabs);
          } else {
            context.go(AppRouterPath.onBoarding);
          }
        } else {}
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: AppIcon(icon: AppIcons.appLogo, width: 200.r, height: 200.r),
      ),
    );
  }
}
