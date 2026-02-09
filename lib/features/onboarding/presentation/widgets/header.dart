import 'package:pinterest_clone/main_index.dart';

class Header extends StatelessWidget {
  final String heading;
  final String para;
  const Header({required this.heading, required this.para, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      spacing: 10.h,
      children: [_buildHeadingTxt(), _buildParaTxt()],
    );
  }

  Text _buildHeadingTxt() {
    return Text(
      textAlign: .center,
      heading,
      style: TextStyle(
        color: AppColors.white,
        fontSize: 20.sp,
        fontWeight: .w600,
      ),
    );
  }

  Text _buildParaTxt() {
    return Text(
      textAlign: .center,
      para,
      style: TextStyle(color: AppColors.white, fontSize: 16.sp),
    );
  }
}
