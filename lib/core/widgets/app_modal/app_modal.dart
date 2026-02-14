import 'package:pinterest_clone/main_index.dart';

class AppModal {
  static Future<T?> showAppModal<T>({
    Color? bgColor,
    required BuildContext context,
    required Widget child,
    BorderRadius? radius,
  }) {
    return showModalBottomSheet(
      backgroundColor: bgColor ?? AppColors.charcolOlive,
      shape: RoundedRectangleBorder(
        borderRadius:
            radius ??
            BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
      ),
      context: context,
      builder: (context) {
        return child;
      },
    );
  }

  static Future<T?> showAppDialog<T>({
    required BuildContext context,
    required Widget child,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(child: child);
      },
    );
  }
}
