import 'package:pinterest_clone/main_index.dart';

Future<T?> showDatePickerDialog<T>({
  required BuildContext context,
  required Widget child,
  required VoidCallback onCancel,
  required VoidCallback onOk,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: false, // prevent outside tap close
    builder: (_) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: .circular(5.r)),
        backgroundColor: AppColors.white,
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            spacing: 30.h,
            mainAxisSize: .min,
            children: [
              child,
              Row(
                spacing: 16.w,
                mainAxisAlignment: .end,
                children: [
                  _dialogTxtBtn(onCancel, "Cancel"),
                  _dialogTxtBtn(onOk, "Ok"),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

TextButton _dialogTxtBtn(VoidCallback callback, String btnTxt) {
  return TextButton(
    onPressed: callback,
    child: Text(
      btnTxt,
      style: TextStyle(
        color: AppColors.black,
        fontSize: 16.sp,
        fontWeight: .w400,
      ),
    ),
  );
}
