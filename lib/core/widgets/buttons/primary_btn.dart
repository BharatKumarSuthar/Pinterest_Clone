import 'package:pinterest_clone/main_index.dart';

class PrimaryBtn extends StatelessWidget {
  final String btnTxt;
  final Color bgColor;
  final VoidCallback callback;
  final EdgeInsets padding;
  final Color txtColor;
  const PrimaryBtn({
    required this.btnTxt,
    this.bgColor = AppColors.pinterestRed,
    required this.callback,
    this.padding = const EdgeInsets.all(12),
    this.txtColor = AppColors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        backgroundColor: bgColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Text(
        btnTxt,
        style: TextStyle(color: txtColor, fontSize: 18.sp),
      ),
    );
  }
}
