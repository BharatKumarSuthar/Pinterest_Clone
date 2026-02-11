import 'package:pinterest_clone/features/home/data/models/photo_model.dart';

abstract class PhotoRemoteDataSource {
  Future<List<PhotoModel>> fetchPhotos({int page = 1, int perPage = 10});
}
