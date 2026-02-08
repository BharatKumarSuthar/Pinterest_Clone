import 'package:pinterest_clone/main_index.dart';

class PrimaryBtn extends StatelessWidget {
  final String btnTxt;
  final Color bgColor;
  final VoidCallback callback;
  final EdgeInsets padding;
  const PrimaryBtn({
    required this.btnTxt,
    this.bgColor = AppColors.pinterestRed,
    required this.callback,
    this.padding = const EdgeInsets.all(12),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.pinterestRed,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Text(
        btnTxt,
        style: TextStyle(color: AppColors.white, fontSize: 18.sp),
      ),
    );
  }
}
