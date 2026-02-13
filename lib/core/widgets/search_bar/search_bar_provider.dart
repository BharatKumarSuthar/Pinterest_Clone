import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/core/widgets/search_bar/search_bar_notifier.dart';
import 'package:pinterest_clone/core/widgets/search_bar/search_bar_state.dart';

final searchBarProvider =
    StateNotifierProvider<SearchBarNotifier, SearchBarState>(
      (ref) => SearchBarNotifier(),
    );
