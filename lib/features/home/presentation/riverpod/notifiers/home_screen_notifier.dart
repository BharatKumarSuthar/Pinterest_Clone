import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/core/widgets/animation/custom_animated_switcher.dart';
import 'package:pinterest_clone/features/home/presentation/screens/pins_feed_screen.dart';

/// State holding the stack of screens and the current index
class HomeScreenState {
  final int currentIndex;
  final List<Widget> screens;

  HomeScreenState({required this.currentIndex, required this.screens});

  HomeScreenState copyWith({int? currentIndex, List<Widget>? screens}) {
    return HomeScreenState(
      currentIndex: currentIndex ?? this.currentIndex,
      screens: screens ?? this.screens,
    );
  }
}

/// Notifier managing push/pop stack and current index inside Home tab
class HomeScreenNotifier extends StateNotifier<HomeScreenState> {
  HomeScreenNotifier()
    : super(
        HomeScreenState(
          currentIndex: 0,
          screens: [CustomAnimatedSwitcher(child: PinsFeedScreen())],
        ),
      );

  /// Switch to a screen in the stack by index
  void setCurrentIndex(int index) {
    if (index < 0 || index >= state.screens.length) return;
    state = state.copyWith(currentIndex: index);
  }

  /// Push a new screen on top of the stack
  void pushScreen(Widget screen) {
    final newScreens = List<Widget>.from(state.screens)..add(screen);
    state = state.copyWith(
      screens: newScreens,
      currentIndex: newScreens.length - 1,
    );
  }

  /// Pop the current screen from the stack
  void popScreen() {
    if (state.screens.length <= 1) return; // Don't pop the root screen
    final newScreens = List<Widget>.from(state.screens)..removeLast();
    state = state.copyWith(
      screens: newScreens,
      currentIndex: newScreens.length - 1,
    );
  }

  /// Pop back to the root screen
  void popToRoot() {
    if (state.screens.length <= 1) return;
    final root = state.screens.first;
    state = state.copyWith(screens: [root], currentIndex: 0);
  }

  /// Safely request a pop after build
  void requestPop() {
    if (state.screens.length > 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        popScreen();
      });
    }
  }
}
