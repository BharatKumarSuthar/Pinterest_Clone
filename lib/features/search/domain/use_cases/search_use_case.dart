import 'package:pinterest_clone/features/search/domain/entities/search_result_entity.dart';
import 'package:pinterest_clone/features/search/domain/repositories/search_repository.dart';

class SearchUseCase {
  final SearchRepository repository;

  SearchUseCase(this.repository);

  /// Executes the search and returns a list of SearchResultModel
  Future<List<SearchResultEntity>> call(String query) async {
    return await repository.search(query);
  }
}
