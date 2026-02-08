import 'dart:async';
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
      Timer(const Duration(milliseconds: 500), () {});
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
