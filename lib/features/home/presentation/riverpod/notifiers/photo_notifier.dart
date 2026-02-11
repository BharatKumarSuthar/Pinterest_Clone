import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/features/home/domain/entities/photo_entity.dart';
import 'package:pinterest_clone/features/home/domain/use_cases/get_photos.dart';

class PhotoNotifier extends StateNotifier<List<PhotoEntity>> {
  final GetPhotos getPhotos;
  int _currentPage = 1;
  bool _isFetching = false;

  // New: Loading states
  bool isLoading = false;
  bool isLoadingMore = false;

  PhotoNotifier(this.getPhotos) : super([]);

  /// Initial load or refresh
  Future<void> fetchInitialPhotos() async {
    _currentPage = 1;
    isLoading = true;
    _isFetching = true;
    try {
      final photos = await getPhotos(page: _currentPage, perPage: 20);
      state = photos;
    } catch (e) {
      print('Error fetching photos: $e');
    } finally {
      isLoading = false;
      _isFetching = false;
    }
  }

  /// Refresh (pull-to-refresh)
  Future<void> refreshPhotos() async {
    if (_isFetching) return;
    _currentPage = 1;
    isLoading = true;
    _isFetching = true;
    try {
      final photos = await getPhotos(page: _currentPage, perPage: 20);
      state = photos;
    } catch (e) {
      print('Error refreshing photos: $e');
    } finally {
      isLoading = false;
      _isFetching = false;
    }
  }

  /// Load more (infinite scroll)
  Future<void> fetchMorePhotos() async {
    if (_isFetching) return;
    _currentPage++;
    isLoadingMore = true;
    _isFetching = true;
    try {
      final photos = await getPhotos(page: _currentPage, perPage: 20);
      state = [...state, ...photos];
    } catch (e) {
      print('Error fetching more photos: $e');
    } finally {
      isLoadingMore = false;
      _isFetching = false;
    }
  }
}
