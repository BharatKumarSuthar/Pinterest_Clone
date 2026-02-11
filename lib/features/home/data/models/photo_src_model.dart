import 'package:pinterest_clone/features/home/domain/entities/photo_entity.dart';

class PhotoSrcModel extends PhotoSrcEntity {
  PhotoSrcModel({
    required super.original,
    required super.large2x,
    required super.large,
    required super.medium,
    required super.small,
    required super.portrait,
    required super.landscape,
    required super.tiny,
  });

  factory PhotoSrcModel.fromJson(Map<String, dynamic> json) {
    return PhotoSrcModel(
      original: json['original'],
      large2x: json['large2x'],
      large: json['large'],
      medium: json['medium'],
      small: json['small'],
      portrait: json['portrait'],
      landscape: json['landscape'],
      tiny: json['tiny'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'original': original,
      'large2x': large2x,
      'large': large,
      'medium': medium,
      'small': small,
      'portrait': portrait,
      'landscape': landscape,
      'tiny': tiny,
    };
  }
}
