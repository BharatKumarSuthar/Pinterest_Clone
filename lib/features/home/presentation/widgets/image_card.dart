import 'package:pinterest_clone/core/widgets/animation/shimmer_animation.dart';
import 'package:pinterest_clone/main_index.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final int imageWidth;
  final int imageHeight;
  final double borderRadius;

  const ImageCard({
    required this.imageUrl,
    required this.imageWidth,
    required this.imageHeight,
    this.borderRadius = 12.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate aspect ratio from actual image
    final aspectRatio = imageWidth / imageHeight;

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              ShimmerAnimation(child: Container(color: AppColors.charcolOlive)),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey.shade300,
            child: Container(
              color: AppColors.white,
              child: const Icon(Icons.error, color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
