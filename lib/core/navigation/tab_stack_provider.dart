import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/core/navigation/app_tab.dart';
import 'package:pinterest_clone/core/navigation/stack_notifier.dart';
import 'package:pinterest_clone/features/search/presentation/screens/search_home_screen.dart';
import 'package:pinterest_clone/main_index.dart';

final tabStackProvider =
    StateNotifierProvider.family<
      StackNotifier, // Notifier type
      TabStackState, // State type
      AppTab // Parameter to differentiate tabs
    >((ref, tab) {
      switch (tab) {
        case AppTab.home:
          return StackNotifier(const Text(""));
        case AppTab.search:
          return StackNotifier(const SearchHomeScreen());
        case AppTab.create:
          return StackNotifier(Container());
        case AppTab.inbox:
          return StackNotifier(const Text(""));
        case AppTab.saved:
          return StackNotifier(const Text(""));
      }
    });
