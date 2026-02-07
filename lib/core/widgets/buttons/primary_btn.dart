import 'package:pinterest_clone/main_index.dart';

class PrimaryBtn extends StatelessWidget {
  final String btnTxt;
  final Color bgColor;
  final VoidCallback callback;
  const PrimaryBtn({
    required this.btnTxt,
    this.bgColor = AppColors.red,
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.red,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
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
