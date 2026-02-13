import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/features/search/data/data_source/search_data_source.dart';
import 'package:pinterest_clone/features/search/data/data_source/search_data_source_impl.dart';
import 'package:pinterest_clone/features/search/data/repositories/search_repository_impl.dart';
import 'package:pinterest_clone/features/search/domain/entities/search_result_entity.dart';
import 'package:pinterest_clone/features/search/domain/repositories/search_repository.dart';
import 'package:pinterest_clone/features/search/domain/use_cases/search_use_case.dart';
import 'package:pinterest_clone/features/search/presentation/riverpod/notifiers/search_query_notifier.dart';
import 'package:pinterest_clone/main_index.dart';

final searchDataSourceProvider = Provider<SearchDataSource>(
  (ref) => SearchDataSourceImpl(),
);

final searchRepoProvider = Provider<SearchRepository>((ref) {
  final datasource = ref.read(searchDataSourceProvider);
  return SearchRepositoryImpl(datasource);
});

final searchQueryProvider =
    StateNotifierProvider<SearchQueryNotifier, List<SearchResultEntity>>((ref) {
      final repo = ref.read(searchRepoProvider);
      final searchUseCase = SearchUseCase(repo);
      return SearchQueryNotifier(searchUseCase);
    });
