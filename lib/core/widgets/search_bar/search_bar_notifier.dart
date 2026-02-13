import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/core/widgets/search_bar/search_bar_state.dart';

class SearchBarNotifier extends StateNotifier<SearchBarState> {
  SearchBarNotifier() : super(const SearchBarState());

  void setFocus(bool value) {
    state = state.copyWith(isFocused: value);
  }

  void setText(String text) {
    state = state.copyWith(hasText: text.trim().isNotEmpty);
  }

  void clear() {
    state = state.copyWith(hasText: false);
  }
}
