import 'package:pinterest_clone/core/network/api_constants.dart';
import 'package:pinterest_clone/core/network/dio_client.dart';
import 'package:pinterest_clone/features/home/data/data_source/photo_remote_data_source.dart';
import 'package:pinterest_clone/features/home/data/models/photo_model.dart';
import 'package:pinterest_clone/main_index.dart';

class PhotoRemoteDataSourceImpl implements PhotoRemoteDataSource {
  @override
  Future<List<PhotoModel>> fetchPhotos({int page = 1, int perPage = 10}) async {
    try {
      var response = await DioClient().dio.get(
        ApiConstants.photos(page, perPage),
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data['photos'];
        return jsonList.map((json) => PhotoModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch photos: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
