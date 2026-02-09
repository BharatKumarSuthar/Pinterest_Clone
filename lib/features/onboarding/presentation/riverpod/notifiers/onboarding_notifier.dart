import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/features/onboarding/domain/entities/onboarding_entity.dart';

class OnboardingNotifier extends StateNotifier<OnboardingEntity> {
  OnboardingNotifier()
    : super(const OnboardingEntity(country: "India", birthDate: "Feb 7, 2026"));

  void setBirthDate(String date) {
    state = state.copyWith(birthDate: date);
  }

  void setGender(String gender) {
    state = state.copyWith(gender: gender);
  }

  void setCountry(String country) {
    state = state.copyWith(country: country);
  }

  void setMoodPreference(List<String> preferences) {
    state = state.copyWith(moodPreferences: preferences);
  }

  void reset() {
    state = const OnboardingEntity();
  }
}
