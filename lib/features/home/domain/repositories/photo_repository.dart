import 'package:pinterest_clone/features/home/domain/entities/photo_entity.dart';

abstract class PhotoRepository {
  /// Fetch a list of photos
  Future<List<PhotoEntity>> getPhotos({int page = 1, int perPage = 10});
}
