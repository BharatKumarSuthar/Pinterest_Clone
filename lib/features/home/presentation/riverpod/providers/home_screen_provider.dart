// Provider
import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/features/home/presentation/riverpod/notifiers/home_screen_notifier.dart';

final homeScreenProvider =
    StateNotifierProvider<HomeScreenNotifier, HomeScreenState>(
      (ref) => HomeScreenNotifier(),
    );
