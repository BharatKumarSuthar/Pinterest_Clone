import 'package:pinterest_clone/main_index.dart';

class SearchPreviewBar extends StatelessWidget {
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onTap;
  final String hintText;
  final double borderRadius;

  const SearchPreviewBar({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.hintText = "Search",
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const .symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(borderRadius),
          border: .all(color: AppColors.white, width: .9),
        ),
        child: Row(
          mainAxisSize: .max,
          children: [
            if (prefixIcon != null) ...[
              Icon(prefixIcon, color: AppColors.white),
              const SizedBox(width: 5),
            ],
            Expanded(
              child: Text(
                maxLines: 1,
                hintText,
                style: const TextStyle(
                  overflow: .clip,
                  color: AppColors.grayDim,
                  fontSize: 18,
                ),
              ),
            ),

            if (suffixIcon != null) Icon(suffixIcon, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}
