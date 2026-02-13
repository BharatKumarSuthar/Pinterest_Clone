import 'package:carousel_slider/carousel_slider.dart';
import 'package:pinterest_clone/features/search/presentation/riverpod/providers/carousel_indicator_provier.dart';
import 'package:pinterest_clone/main_index.dart';

class CustomCarousel extends ConsumerWidget {
  final List<Widget> items;
  const CustomCarousel({required this.items, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(carouselIndicatorProvider);
    return Column(
      mainAxisSize: .min,
      spacing: 8,
      children: [
        CarouselSlider(
          items: items,
          options: CarouselOptions(
            height: 400.0,
            autoPlay: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              ref.read(carouselIndicatorProvider.notifier).updateIndex(index);
            },
          ),
        ),
        _buildCarouselIndicator(currentIndex),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildCarouselIndicator(int currentIndex) {
    return Row(
      mainAxisAlignment: .center,
      spacing: 10.w,
      children: List.generate(items.length, (index) {
        return Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: (index == currentIndex)
                ? AppColors.white
                : AppColors.grayDim,
            shape: .circle,
          ),
        );
      }),
    );
  }
}
