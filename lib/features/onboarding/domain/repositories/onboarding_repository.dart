import 'package:pinterest_clone/features/onboarding/domain/entities/onboarding_entity.dart';

abstract class OnboardingRepository {
  Future<void> submitOnboarding(OnboardingEntity entity);
}
