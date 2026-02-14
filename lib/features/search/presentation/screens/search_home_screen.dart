import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinterest_clone/core/constants/app_strings.dart';
import 'package:pinterest_clone/core/navigation/app_tab.dart';
import 'package:pinterest_clone/core/navigation/tab_stack_provider.dart';
import 'package:pinterest_clone/core/widgets/loading/pinterest_refresh_indicator.dart';
import 'package:pinterest_clone/core/widgets/search_bar/search_preview_bar.dart';
import 'package:pinterest_clone/features/search/presentation/screens/search_query_screen.dart';
import 'package:pinterest_clone/features/search/presentation/widgets/carousel_image_card.dart';
import 'package:pinterest_clone/features/search/presentation/widgets/custom_carousel.dart';

class SearchHomeScreen extends ConsumerStatefulWidget {
  const SearchHomeScreen({super.key});

  @override
  ConsumerState<SearchHomeScreen> createState() => _SearchHomeScreenState();
}

class _SearchHomeScreenState extends ConsumerState<SearchHomeScreen>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _animationController = AnimationController(vsync: this);

    _scrollController.addListener(() {
      // Example: detect scroll direction
      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse &&
          _scrollController.offset >= 100) {
        _animationController.value =
            ((_scrollController.offset - 100.0) / 350.0).clamp(0.0, 1.0);
        debugPrint("Scrolling Down");
        debugPrint(_animationController.value.toString());
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        _animationController.value = (_scrollController.offset / 350.0).clamp(
          0.0,
          1.0,
        );
        debugPrint(_animationController.value.toString());
        debugPrint("Scrolling Up");
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PinterestRefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 4));
          },
          child: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                toolbarHeight: (20 * 2) + 50,
                automaticallyImplyLeading: false,
              ),
              SliverToBoxAdapter(
                child: CustomCarousel(
                  items: List.generate(5, (index) {
                    return CarouselImageCard(
                      imageUrl:
                          "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg",
                    );
                  }),
                ),
              ),
              SliverList.separated(
                itemBuilder: (context, index) {
                  return Container(height: 150, color: Colors.red);
                },
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: 20,
              ),
            ],
          ),
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Container(
              color: Colors.black.withValues(
                alpha: _animationController.value, // ensure opacity is 0 → 1
              ),
              padding: const .symmetric(vertical: 20, horizontal: 10),
              child: child,
            );
          },
          child: SearchPreviewBar(
            hintText: AppStrings.searchIdeas,
            prefixIcon: Icons.search_outlined,
            suffixIcon: Icons.camera_alt_outlined,
            onTap: () {
              ref
                  .read(tabStackProvider(AppTab.search).notifier)
                  .push(SearchQueryScreen());
            },
          ),
        ),
      ],
    );
  }
}
