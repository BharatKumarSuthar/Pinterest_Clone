import 'package:pinterest_clone/core/network/api_constants.dart';
import 'package:pinterest_clone/main_index.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();

  late final Dio dio;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: Duration(milliseconds: ApiConstants.connectTimeout),
        receiveTimeout: Duration(milliseconds: ApiConstants.receiveTimeout),
        responseType: ResponseType.json,
        headers: {'Authorization': ApiConstants.apiKey},
      ),
    );
  }
}
