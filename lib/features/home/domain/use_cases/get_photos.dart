import '../entities/photo_entity.dart';
import '../repositories/photo_repository.dart';

class GetPhotos {
  final PhotoRepository repository;

  GetPhotos(this.repository);

  /// Fetch photos with optional pagination
  Future<List<PhotoEntity>> call({int page = 1, int perPage = 10}) async {
    return await repository.getPhotos(page: page, perPage: perPage);
  }
}
