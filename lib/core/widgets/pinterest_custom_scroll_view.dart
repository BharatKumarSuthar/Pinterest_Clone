import 'package:pinterest_clone/core/widgets/keep_alive_wrapper.dart';
import 'package:pinterest_clone/features/home/domain/entities/photo_entity.dart';
import 'package:pinterest_clone/features/home/presentation/riverpod/providers/photo_provider.dart';
import 'package:pinterest_clone/features/home/presentation/widgets/image_card.dart';
import 'package:pinterest_clone/main_index.dart';

class PinterestCustomScrollView extends ConsumerStatefulWidget {
  final List<Widget> slivers;
  final List<PhotoEntity> photos;
  final ScrollPhysics physics;
  final void Function(PhotoEntity)? onImageTap;

  const PinterestCustomScrollView({
    this.physics = const BouncingScrollPhysics(),
    required this.photos,
    this.slivers = const [],
    this.onImageTap,
    super.key,
  });

  @override
  ConsumerState<PinterestCustomScrollView> createState() =>
      _PinterestGridViewState();
}

class _PinterestGridViewState extends ConsumerState<PinterestCustomScrollView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Initial load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(photoNotifierProvider.notifier).fetchInitialPhotos();
    });

    // Infinite scroll listener
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 300) {
        ref.read(photoNotifierProvider.notifier).fetchMorePhotos();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final photos = ref.watch(photoNotifierProvider);
    //final notifier = ref.read(photoNotifierProvider.notifier);
    return KeepAliveWrapper(
      child: CustomScrollView(
        controller: _scrollController,
        physics: widget.physics,
        slivers: [
          if (widget.slivers.isNotEmpty) ...widget.slivers,
          SliverPadding(
            padding: .symmetric(horizontal: 5),
            sliver: SliverMasonryGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 5,
              childCount: photos.photos.length,
              itemBuilder: (context, index) {
                final photo = photos.photos[index];
                return GestureDetector(
                  onTap: () {
                    if (widget.onImageTap != null) {
                      widget.onImageTap!(photo);
                    }
                  },
                  child: ImageCard(
                    imageUrl: photo.src.medium,
                    imageWidth: photo.width,
                    imageHeight: photo.height,
                  ),
                );
              },
            ),
          ),
          if (photos.isLoadingMore)
            SliverPadding(
              padding: .symmetric(horizontal: 20, vertical: 40),
              sliver: SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }
}
