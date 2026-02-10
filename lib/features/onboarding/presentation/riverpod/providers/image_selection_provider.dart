import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/features/onboarding/presentation/riverpod/notifiers/image_selection_notifier.dart';

final imageSelectionProvider =
    StateNotifierProvider<ImageSelectionNotifier, Set<int>>(
      (ref) => ImageSelectionNotifier(),
    );
