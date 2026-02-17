import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/features/home/domain/entities/photo_entity.dart';
import 'package:pinterest_clone/features/home/domain/use_cases/get_photos.dart';

class PhotoState {
  final List<PhotoEntity> photos;
  final bool isLoading;
  final bool isRefreshing;
  final bool isLoadingMore;

  const PhotoState({
    this.photos = const [],
    this.isLoading = false,
    this.isRefreshing = false,
    this.isLoadingMore = false,
  });

  PhotoState copyWith({
    List<PhotoEntity>? photos,
    bool? isLoading,
    bool? isRefreshing,
    bool? isLoadingMore,
  }) {
    return PhotoState(
      photos: photos ?? this.photos,
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class PhotoNotifier extends StateNotifier<PhotoState> {
  final GetPhotos getPhotos;
  int _currentPage = 1;
  bool _isFetching = false;

  PhotoNotifier(this.getPhotos) : super(const PhotoState());

  ///Initial load
  Future<void> fetchInitialPhotos() async {
    if (_isFetching) return;
    _currentPage = 1;
    _isFetching = true;

    state = state.copyWith(isLoading: true);

    try {
      final photos = await getPhotos(page: _currentPage, perPage: 20);
      state = state.copyWith(photos: photos);
    } catch (e) {
      print('Initial load error: $e');
    } finally {
      state = state.copyWith(isLoading: false);
      _isFetching = false;
    }
  }

  /// Pull-to-refresh
  Future<void> refreshPhotos() async {
    if (_isFetching) return;
    _currentPage++;
    _isFetching = true;

    state = state.copyWith(isRefreshing: true);

    try {
      final photos = await getPhotos(page: _currentPage, perPage: 20);
      state = state.copyWith(photos: photos);
    } catch (e) {
      print('Refresh error: $e');
    } finally {
      state = state.copyWith(isRefreshing: false);
      _isFetching = false;
    }
  }

  /// Infinite scroll
  Future<void> fetchMorePhotos() async {
    if (_isFetching) return;
    _currentPage++;
    _isFetching = true;

    state = state.copyWith(isLoadingMore: true);

    try {
      final photos = await getPhotos(page: _currentPage, perPage: 20);
      state = state.copyWith(photos: [...state.photos, ...photos]);
    } catch (e) {
      print('Load more error: $e');
    } finally {
      state = state.copyWith(isLoadingMore: false);
      _isFetching = false;
    }
  }
}
