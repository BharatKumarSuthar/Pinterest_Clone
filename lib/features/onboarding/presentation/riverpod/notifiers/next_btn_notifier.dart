import 'package:flutter_riverpod/legacy.dart';

class NextBtnNotifier extends StateNotifier<bool> {
  NextBtnNotifier() : super(false);

  void handelNext() {
    state = true;
  }
}
