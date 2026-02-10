import 'package:pinterest_clone/main_index.dart';

class IconWithBackground extends StatelessWidget {
  final Widget icon;
  final Color bgColor;
  final EdgeInsets? padding;
  final double borderRadius;
  IconWithBackground({
    required this.icon,
    this.bgColor = AppColors.white,
    double? size,
    EdgeInsets? padding,
    this.borderRadius = 8,
    super.key,
  }) : padding = padding ?? EdgeInsets.all(10.r);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: .circular(borderRadius),
      ),
      child: icon,
    );
  }
}
