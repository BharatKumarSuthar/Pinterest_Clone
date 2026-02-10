// data/repositories/mood_preference_repository_impl.dart
import 'package:pinterest_clone/features/onboarding/data/data_source/mood_preference_data_source.dart';

import '../../domain/entities/mood_preference_entity.dart';
import '../../domain/repositories/mood_preference_repository.dart';
import '../models/mood_preference_model.dart';

class MoodPreferenceRepositoryImpl implements MoodPreferenceRepository {
  final MoodPreferenceDataSource dataSource;

  MoodPreferenceRepositoryImpl({required this.dataSource});

  @override
  List<MoodPreferenceEntity> getMoodPreferences() {
    // Fetch models from data source
    List<MoodPreferenceModel> models = dataSource.getMoodPreferences();

    // Map models to entities (here they are already compatible)
    return models.map((model) => model.toEntity()).toList();
  }
}
