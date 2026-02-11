import 'package:pinterest_clone/core/widgets/animation/shimmer_animation.dart';
import 'package:pinterest_clone/core/widgets/buttons/primary_btn.dart';
import 'package:pinterest_clone/features/home/domain/entities/photo_entity.dart';
import 'package:pinterest_clone/main_index.dart';

class DetailImageCard extends StatelessWidget {
  final PhotoEntity photo;
  final double borderRadius;

  const DetailImageCard({
    required this.photo,
    this.borderRadius = 12.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: .start,
      children: [
        // Image
        Padding(
          padding: .all(8.r),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: CachedNetworkImage(
              imageUrl: photo.src.large,
              width: double.maxFinite,
              height: (photo.height / 10).toDouble(),
              fit: BoxFit.cover,
              placeholder: (context, url) => ShimmerAnimation(
                child: Container(
                  width: double.maxFinite,
                  color: Colors.grey.shade300,
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: double.maxFinite,
                color: Colors.grey.shade300,
                child: const Icon(Icons.error, color: Colors.red),
              ),
            ),
          ),
        ),
        _optionsAndProfileColumn(),
      ],
    );
  }

  /// Gesture detector for icon
  Widget _buildTapIcon(IconData icon, String tooltip, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Tooltip(
          message: tooltip,
          preferBelow: false,
          child: Icon(icon, size: 24.r, color: AppColors.white),
        ),
      ),
    );
  }

  Widget _buildProfileIconWithName() {
    return Row(
      mainAxisSize: .min,
      children: [
        Padding(
          padding: .all(8),
          child: CircleAvatar(
            backgroundColor: AppColors.pinterestRed,
            radius: 12.r,
            child: CachedNetworkImage(
              imageUrl: photo.photographerUrl,
              height: 20.r,
              width: 20.r,
              placeholder: (context, url) {
                return Text(
                  textAlign: .center,
                  photo.photographer[0].toUpperCase(),
                  style: TextStyle(color: AppColors.white, fontSize: 12.sp),
                );
              },
              errorWidget: (context, url, error) {
                return Text(
                  textAlign: .center,
                  photo.photographer[0].toUpperCase(),
                  style: TextStyle(color: AppColors.white, fontSize: 12.sp),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Text(
            maxLines: 1,
            photo.photographer,
            style: TextStyle(
              overflow: .visible,
              color: AppColors.white,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOptions() {
    return Row(
      mainAxisSize: .max,
      mainAxisAlignment: .spaceBetween,
      spacing: 20.w,
      children: [
        _buildTapIcon(Icons.favorite_outline, "Like", () {}),
        _buildTapIcon(Icons.message_outlined, "Message", () {}),
        _buildTapIcon(Icons.share_outlined, "Share", () {}),
        _buildTapIcon(Icons.more_horiz, "More", () {}),
        Expanded(child: SizedBox()),
        PrimaryBtn(
          bgColor: AppColors.pinterestRed,
          padding: .all(10.r),
          btnTxt: "Save",
          callback: () {},
        ),
      ],
    );
  }

  Padding _moreToExplore() {
    return Padding(
      padding: .only(left: 8.w),
      child: Text(
        "More to explore",
        style: TextStyle(
          color: AppColors.white,
          fontSize: 20.sp,
          fontWeight: .w700,
        ),
      ),
    );
  }

  Widget _optionsAndProfileColumn() {
    return Padding(
      padding: .symmetric(horizontal: 10.w),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          _buildOptions(),
          _buildProfileIconWithName(),
          _moreToExplore(),
        ],
      ),
    );
  }
}
