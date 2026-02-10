// data/models/mood_preference_model.dart
import '../../domain/entities/mood_preference_entity.dart';

class MoodPreferenceModel extends MoodPreferenceEntity {
  const MoodPreferenceModel({required super.title, required super.imageUrl});

  factory MoodPreferenceModel.fromJson(Map<String, dynamic> json) {
    return MoodPreferenceModel(
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'imageUrl': imageUrl};
  }

  MoodPreferenceEntity toEntity() => this;
}
