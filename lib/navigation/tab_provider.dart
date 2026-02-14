import 'package:flutter_riverpod/legacy.dart';

class TabState {
  final int currentTab;
  final int previousTab;
  TabState({required this.currentTab, required this.previousTab});

  TabState copyWith({int? currentTab, int? previousTab}) {
    return TabState(
      currentTab: currentTab ?? this.currentTab,
      previousTab: previousTab ?? this.previousTab,
    );
  }
}

/// StateNotifier to manage the current selected tab
class TabProvider extends StateNotifier<TabState> {
  TabProvider() : super(TabState(currentTab: 0, previousTab: 0));

  void setTab(int index) {
    if (state.currentTab >= state.previousTab) {
      state = state.copyWith(currentTab: index, previousTab: state.currentTab);
    } else if (state.currentTab < state.previousTab) {
      state = state.copyWith(currentTab: index, previousTab: 0);
    }
  }
}

/// Riverpod provider for the TabProvider
final tabProvider = StateNotifierProvider<TabProvider, TabState>((ref) {
  return TabProvider();
});
