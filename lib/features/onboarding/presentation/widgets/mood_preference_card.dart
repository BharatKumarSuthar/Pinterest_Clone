import 'dart:math';

import 'package:pinterest_clone/core/widgets/animation/shimmer_animation.dart';
import 'package:pinterest_clone/core/widgets/app_icon/icon_with_background.dart';
import 'package:pinterest_clone/features/onboarding/presentation/riverpod/notifiers/image_selection_notifier.dart';
import 'package:pinterest_clone/main_index.dart';

class MoodPreferenceCard extends ConsumerWidget {
  final int index;
  final String title;
  final String imageUrl;
  const MoodPreferenceCard({
    required this.index,
    required this.imageUrl,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndices = ref.watch(imageSelectionProvider);
    final isSelected = selectedIndices.contains(index);
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            GestureDetector(
              onTap: () {
                ref.read(imageSelectionProvider.notifier).toggle(index);
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: .circular(8.r),
                    child: Image(
                      image: imageProvider,
                      height: 120,
                      fit: .cover,
                    ),
                  ),
                  if (isSelected)
                    Positioned(
                      bottom: 8.r,
                      right: 8.r,
                      child: IconWithBackground(
                        borderRadius: 10.r,
                        padding: .all(5.r),
                        bgColor: AppColors.white.withValues(alpha: .5),
                        icon: Icon(
                          Icons.check,
                          color: AppColors.grayDim,
                          size: 24.r,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Text(title),
          ],
        );
      },
      placeholder: (context, url) {
        return ShimmerAnimation(
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: .circular(8.r),
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          height: 120,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: .circular(8.r),
          ),
          child: Center(child: Icon(Icons.error, color: Colors.red)),
        );
      },
    );
  }
}
