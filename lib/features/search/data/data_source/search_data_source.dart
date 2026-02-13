import 'package:pinterest_clone/features/search/data/models/search_result_model.dart';

abstract class SearchDataSource {
  Future<List<SearchResultModel>> search(String query);
}
