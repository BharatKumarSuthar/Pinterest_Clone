import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/features/onboarding/domain/entities/onboarding_entity.dart';
import 'package:pinterest_clone/features/onboarding/presentation/riverpod/notifiers/onboarding_notifier.dart';

final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingEntity>(
      (ref) => OnboardingNotifier(),
    );
