import 'package:pinterest_clone/features/home/data/models/photo_src_model.dart';
import 'package:pinterest_clone/features/home/domain/entities/photo_entity.dart';

class PhotoModel extends PhotoEntity {
  PhotoModel({
    required super.id,
    required super.width,
    required super.height,
    required super.url,
    required super.photographer,
    required super.photographerUrl,
    required super.photographerId,
    required super.avgColor,
    required super.src,
    required super.liked,
    required super.alt,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      photographer: json['photographer'],
      photographerUrl: json['photographer_url'],
      photographerId: json['photographer_id'],
      avgColor: json['avg_color'],
      src: PhotoSrcModel.fromJson(json['src']),
      liked: json['liked'] ?? false,
      alt: json['alt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
      'photographer': photographer,
      'photographer_url': photographerUrl,
      'photographer_id': photographerId,
      'avg_color': avgColor,
      'src': (src as PhotoSrcModel).toJson(),
      'liked': liked,
      'alt': alt,
    };
  }
}
