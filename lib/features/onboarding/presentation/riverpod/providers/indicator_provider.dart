import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/features/onboarding/presentation/riverpod/notifiers/indicator_notifier.dart';

final indicatorProvider = StateNotifierProvider<IndicatorNotifier, int>((ref) {
  return IndicatorNotifier();
});
