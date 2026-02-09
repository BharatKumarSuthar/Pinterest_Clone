import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/features/onboarding/presentation/riverpod/notifiers/next_btn_notifier.dart';

final nextButtonProvider = StateNotifierProvider<NextBtnNotifier, bool>((ref) {
  return NextBtnNotifier();
});
