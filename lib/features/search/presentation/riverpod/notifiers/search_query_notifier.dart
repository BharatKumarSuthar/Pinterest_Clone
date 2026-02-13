import 'dart:async';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/features/search/domain/entities/search_result_entity.dart';
import 'package:pinterest_clone/features/search/domain/use_cases/search_use_case.dart';

/// Notifier for search results with debounce
class SearchQueryNotifier extends StateNotifier<List<SearchResultEntity>> {
  final SearchUseCase _searchUseCase;
  Timer? _debounce;

  SearchQueryNotifier(this._searchUseCase) : super([]);

  /// Call this whenever user types
  void search(String query) {
    // Cancel any previous timer
    _debounce?.cancel();

    // Debounce timer (e.g., 500ms)
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (query.trim().isEmpty) {
        state = []; // Clear results if query is empty
        return;
      }

      try {
        final results = await _searchUseCase(query);
        state = results;
      } catch (e) {
        // Handle errors gracefully
        state = [];
      }
    });
  }

  void clear() {
    state = [];
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
