import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/features/search/presentation/riverpod/notifiers/carousel_indicator_notifier.dart';

final carouselIndicatorProvider =
    StateNotifierProvider<CarouselIndicatorNotifier, int>(
      (ref) => CarouselIndicatorNotifier(),
    );
