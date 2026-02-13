import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/main_index.dart';

class TabStackState {
  final List<Widget> screens;
  final int currentIndex;

  TabStackState({required this.screens, required this.currentIndex});

  // CopyWith for updating state immutably
  TabStackState copyWith({List<Widget>? screens, int? currentIndex}) {
    return TabStackState(
      screens: screens ?? this.screens,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

class StackNotifier extends StateNotifier<TabStackState> {
  StackNotifier(Widget initialScreen)
    : super(TabStackState(screens: [initialScreen], currentIndex: 0));

  void push(Widget screen) {
    final newScreens = [...state.screens, screen];
    state = state.copyWith(
      screens: newScreens,
      currentIndex: newScreens.length - 1,
    );
  }

  void pop() {
    if (canPop) {
      final newScreens = state.screens.sublist(0, state.screens.length - 1);
      state = state.copyWith(
        screens: newScreens,
        currentIndex: newScreens.length - 1,
      );
    }
  }

  bool get canPop => state.screens.length > 1;

  void popUntilRoot() {
    state = state.copyWith(screens: [state.screens.first], currentIndex: 0);
  }
}
