import 'package:pinterest_clone/features/home/data/data_source/photo_remote_data_source.dart';
import 'package:pinterest_clone/features/home/domain/entities/photo_entity.dart';
import 'package:pinterest_clone/features/home/domain/repositories/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoRemoteDataSource dataSource;
  const PhotoRepositoryImpl(this.dataSource);
  @override
  Future<List<PhotoEntity>> getPhotos({int page = 1, int perPage = 10}) async {
    return await dataSource.fetchPhotos();
  }
}
