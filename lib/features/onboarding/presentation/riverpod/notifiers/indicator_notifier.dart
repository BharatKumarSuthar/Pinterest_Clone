import 'package:flutter_riverpod/legacy.dart';

class IndicatorNotifier extends StateNotifier<int> {
  IndicatorNotifier() : super(0);

  void currentIndex() {
    state++;
  }
}
