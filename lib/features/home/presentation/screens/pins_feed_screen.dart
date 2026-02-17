import 'package:pinterest_clone/core/constants/app_strings.dart';
import 'package:pinterest_clone/core/widgets/app_icon/icon_with_background.dart';
import 'package:pinterest_clone/core/widgets/loading/pinterest_refresh_indicator.dart';
import 'package:pinterest_clone/core/widgets/pinterest_custom_scroll_view.dart';
import 'package:pinterest_clone/features/home/presentation/riverpod/providers/home_screen_provider.dart';
import 'package:pinterest_clone/features/home/presentation/riverpod/providers/photo_provider.dart';
import 'package:pinterest_clone/features/home/presentation/screens/image_detail_screen.dart';
import 'package:pinterest_clone/main_index.dart';

class PinsFeedScreen extends ConsumerWidget {
  const PinsFeedScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("BUILD METHOD");
    final homeNotifier = ref.read(homeScreenProvider.notifier);
    //final photos = ref.watch(photoNotifierProvider);
    final notifier = ref.read(photoNotifierProvider.notifier);
    final isLoading = ref.watch(
      photoNotifierProvider.select((s) => s.isLoading),
    );
    final photos = ref.watch(photoNotifierProvider.select((s) => s.photos));
    return Column(
      children: [
        _appBar(context: context),
        Expanded(
          child: isLoading && photos.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : PinterestRefreshIndicator(
                  onRefresh: () async {
                    await notifier.refreshPhotos();
                  },
                  child: PinterestCustomScrollView(
                    photos: photos,
                    onImageTap: (photo) {
                      homeNotifier.pushScreen(ImageDetailScreen(photo: photo));
                    },
                    //scrollController: scrollController,
                  ),
                ),
        ),
      ],
    );
  }

  Widget _appBar({required BuildContext context}) {
    return Padding(
      padding: .symmetric(horizontal: 15.w, vertical: 10.h),
      child: Row(
        mainAxisSize: .max,
        mainAxisAlignment: .spaceBetween,
        crossAxisAlignment: .end,
        children: [
          Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              Text(
                AppStrings.forYou,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 17.sp,
                  fontWeight: .w600,
                ),
              ),
              Container(width: 60.w, color: AppColors.white, height: 2.h),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: IconWithBackground(
              icon: SvgPicture.asset(AppIcons.pen, width: 18.r, height: 18.r),
              bgColor: AppColors.charcolGray,
              borderRadius: 12.r,
            ),
          ),
        ],
      ),
    );
  }
}
