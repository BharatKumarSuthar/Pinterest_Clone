import 'package:pinterest_clone/core/widgets/animation/custom_animated_switcher.dart';
import 'package:pinterest_clone/core/widgets/app_icon/icon_with_background.dart';
import 'package:pinterest_clone/core/widgets/pinterest_custom_scroll_view.dart';
import 'package:pinterest_clone/features/home/domain/entities/photo_entity.dart';
import 'package:pinterest_clone/features/home/presentation/riverpod/providers/home_screen_provider.dart';
import 'package:pinterest_clone/features/home/presentation/riverpod/providers/photo_provider.dart';
import 'package:pinterest_clone/features/home/presentation/widgets/detail_image_card.dart';
import 'package:pinterest_clone/main_index.dart';

class ImageDetailScreen extends ConsumerWidget {
  final PhotoEntity photo;

  const ImageDetailScreen({required this.photo, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photos = ref.watch(photoNotifierProvider);
    final homeNotifier = ref.watch(homeScreenProvider.notifier);
    return CustomAnimatedSwitcher(
      child: Stack(
        fit: .expand,
        children: [
          PinterestCustomScrollView(
            onImageTap: (photo) {
              homeNotifier.pushScreen(ImageDetailScreen(photo: photo));
            },
            slivers: [
              SliverToBoxAdapter(
                child: DetailImageCard(borderRadius: 20.r, photo: photo),
              ),
            ],
            physics: AlwaysScrollableScrollPhysics(),
            photos: photos.photos,
          ),
          Positioned(
            left: 10.w,
            top: 5.h,
            child: GestureDetector(
              onTap: () {
                homeNotifier.popScreen();
              },
              child: IconWithBackground(
                borderRadius: 15.r,
                padding: .all(12.r),
                bgColor: AppColors.white.withValues(alpha: .7),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.black,
                  size: 30.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
