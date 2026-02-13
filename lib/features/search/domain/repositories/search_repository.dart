import 'package:pinterest_clone/features/search/domain/entities/search_result_entity.dart';

abstract class SearchRepository {
  /// Searches for items matching the query
  Future<List<SearchResultEntity>> search(String query);
}
