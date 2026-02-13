import 'package:pinterest_clone/features/search/data/data_source/search_data_source.dart';
import 'package:pinterest_clone/features/search/domain/entities/search_result_entity.dart';
import 'package:pinterest_clone/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource dataSource;

  const SearchRepositoryImpl(this.dataSource);
  @override
  Future<List<SearchResultEntity>> search(String query) async {
    return await dataSource.search(query);
  }
}
