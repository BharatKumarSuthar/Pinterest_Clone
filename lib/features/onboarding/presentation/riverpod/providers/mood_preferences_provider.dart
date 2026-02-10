// presentation/providers/mood_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinterest_clone/features/onboarding/data/data_source/mood_preference_data_source.dart';
import 'package:pinterest_clone/features/onboarding/data/repositories/mood_preference_repository_imp.dart';
import 'package:pinterest_clone/features/onboarding/domain/entities/mood_preference_entity.dart';
import 'package:pinterest_clone/features/onboarding/domain/repositories/mood_preference_repository.dart';
import 'package:pinterest_clone/features/onboarding/domain/use_cases/get_mood_preference.dart';

// Repository provider
final moodRepositoryProvider = Provider<MoodPreferenceRepository>((ref) {
  final dataSource = MoodPreferenceDataSource();
  return MoodPreferenceRepositoryImpl(dataSource: dataSource);
});

// Use case provider
final getMoodPreferencesUseCaseProvider = Provider<GetMoodPreference>((ref) {
  final repository = ref.read(moodRepositoryProvider);
  return GetMoodPreference(repository);
});

// Async provider for UI
final moodListProvider = Provider<List<MoodPreferenceEntity>>((ref) {
  final useCase = ref.read(getMoodPreferencesUseCaseProvider);
  return useCase();
});
