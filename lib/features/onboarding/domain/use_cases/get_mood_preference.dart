import 'package:pinterest_clone/features/onboarding/domain/entities/mood_preference_entity.dart';
import 'package:pinterest_clone/features/onboarding/domain/repositories/mood_preference_repository.dart';

class GetMoodPreference {
  final MoodPreferenceRepository repository;
  const GetMoodPreference(this.repository);
  List<MoodPreferenceEntity> call() {
    return repository.getMoodPreferences();
  }
}
