import 'package:flutter_riverpod/legacy.dart';

class CarouselIndicatorNotifier extends StateNotifier<int> {
  CarouselIndicatorNotifier() : super(0);

  void updateIndex(int currentIndex) {
    state = currentIndex;
  }
}
