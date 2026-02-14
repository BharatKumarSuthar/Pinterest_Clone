import 'package:pinterest_clone/core/constants/app_strings.dart';
import 'package:pinterest_clone/core/widgets/app_icon/icon_with_background.dart';
import 'package:pinterest_clone/main_index.dart';

class CreateBottomModal extends StatelessWidget {
  const CreateBottomModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Icon(Icons.close, color: AppColors.white, size: 30.r),
          ),
          Expanded(
            child: Column(
              mainAxisSize: .min,
              spacing: 20.0,
              children: [
                Text(
                  AppStrings.startCreatingNow,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18.sp,
                    fontWeight: .w500,
                  ),
                ),
                Row(
                  spacing: 15.0,
                  mainAxisSize: .max,
                  mainAxisAlignment: .center,
                  children: [
                    _createModalIconWithLabel(
                      icon: AppIcons.pin,
                      label: AppStrings.pin,
                      context: context,
                      onTap: () {},
                    ),
                    _createModalIconWithLabel(
                      icon: AppIcons.collage,
                      label: AppStrings.collage,
                      context: context,
                      onTap: () {},
                    ),
                    _createModalIconWithLabel(
                      icon: AppIcons.board,
                      label: AppStrings.board,
                      context: context,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 30.0),
        ],
      ),
    );
  }
}

Widget _createModalIconWithLabel({
  required String icon,
  required String label,
  required BuildContext context,
  required VoidCallback onTap,
}) {
  return Column(
    children: [
      GestureDetector(
        onTap: onTap,
        child: IconWithBackground(
          borderRadius: 18.r,
          bgColor: AppColors.charcolGray,
          padding: .all(20.0),
          icon: SvgPicture.asset(icon, width: 30.r, height: 30.r),
        ),
      ),
      Text(
        label,
        style: TextStyle(color: AppColors.white, fontWeight: .w600),
      ),
    ],
  );
}
