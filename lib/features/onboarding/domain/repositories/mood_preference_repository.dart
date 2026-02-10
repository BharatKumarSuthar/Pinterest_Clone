import 'package:pinterest_clone/features/onboarding/domain/entities/mood_preference_entity.dart';

abstract class MoodPreferenceRepository {
  /// Get all mood preferences
  List<MoodPreferenceEntity> getMoodPreferences();
}
