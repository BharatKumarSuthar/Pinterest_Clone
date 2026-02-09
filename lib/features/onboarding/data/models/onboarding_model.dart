import '../../domain/entities/onboarding_entity.dart';

class OnboardingModel extends OnboardingEntity {
  const OnboardingModel({
    super.birthDate,
    super.country,
    super.gender,
    super.moodPreferences,
  });

  /// Entity ➜ Model
  factory OnboardingModel.fromEntity(OnboardingEntity entity) {
    return OnboardingModel(
      birthDate: entity.birthDate,
      country: entity.country,
      gender: entity.gender,
      moodPreferences: entity.moodPreferences,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'birth_date': birthDate,
      'country': country,
      'gender': gender,
      'mood_preferences': moodPreferences,
    };
  }

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
      birthDate: json['birth_date'] as String?,
      country: json['country'] as String?,
      gender: json['gender'] as String?,
      moodPreferences: (json['mood_preferences'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
    );
  }
}
