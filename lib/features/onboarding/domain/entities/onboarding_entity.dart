class OnboardingEntity {
  final String? birthDate;
  final String? country;
  final String? gender;
  final List<String>? moodPreferences;

  const OnboardingEntity({
    this.birthDate,
    this.country,
    this.gender,
    this.moodPreferences,
  });

  OnboardingEntity copyWith({
    String? birthDate,
    String? country,
    String? gender,
    List<String>? moodPreferences,
  }) {
    return OnboardingEntity(
      birthDate: birthDate ?? this.birthDate,
      country: country ?? this.country,
      gender: gender ?? this.gender,
      moodPreferences: moodPreferences ?? this.moodPreferences,
    );
  }
}
