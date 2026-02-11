import 'package:pinterest_clone/main_index.dart';

class CustomAnimatedSwitcher extends StatelessWidget {
  final Widget child;
  const CustomAnimatedSwitcher({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, animation) {
        // Always slide in from right to left
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation);
        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: child,
    );
  }
}
