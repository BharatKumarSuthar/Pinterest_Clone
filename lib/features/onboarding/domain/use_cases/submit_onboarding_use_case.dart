import '../entities/onboarding_entity.dart';
import '../repositories/onboarding_repository.dart';

class SubmitOnboardingUseCase {
  final OnboardingRepository repository;

  SubmitOnboardingUseCase(this.repository);

  Future<void> call(OnboardingEntity entity) async {
    await repository.submitOnboarding(entity);
  }
}
