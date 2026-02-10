import 'package:pinterest_clone/main_index.dart';

class ShimmerAnimation extends StatelessWidget {
  final Widget child;
  const ShimmerAnimation({required this.child, super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!, // Darker grey
      highlightColor: Colors.grey[700]!, // Lighter grey
      child: child,
    );
  }
}
