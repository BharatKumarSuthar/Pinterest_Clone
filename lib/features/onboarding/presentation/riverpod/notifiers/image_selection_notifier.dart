import 'package:flutter_riverpod/legacy.dart';

// A StateNotifier to manage selected images
class ImageSelectionNotifier extends StateNotifier<Set<int>> {
  ImageSelectionNotifier() : super({});

  // Toggle selection
  void toggle(int index) {
    if (state.contains(index)) {
      state = {...state}..remove(index);
    } else {
      state = {...state}..add(index);
    }
  }

  // Check if image is selected
  bool isSelected(int index) => state.contains(index);
}

// Riverpod provider
final imageSelectionProvider =
    StateNotifierProvider<ImageSelectionNotifier, Set<int>>(
      (ref) => ImageSelectionNotifier(),
    );
