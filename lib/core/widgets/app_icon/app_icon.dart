import 'package:pinterest_clone/main_index.dart';

class AppIcon extends StatelessWidget {
  final String icon;
  final double width;
  final double height;
  const AppIcon({
    required this.icon,
    this.width = 24.0,
    this.height = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(icon, width: width, height: height);
  }
}
