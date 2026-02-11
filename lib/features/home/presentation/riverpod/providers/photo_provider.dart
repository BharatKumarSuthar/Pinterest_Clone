import 'package:flutter_riverpod/legacy.dart';
import 'package:pinterest_clone/features/home/data/data_source/photo_remote_data_source.dart';
import 'package:pinterest_clone/features/home/data/data_source/photo_remote_data_source_impl.dart';
import 'package:pinterest_clone/features/home/data/repositories/photo_repository_impl.dart';
import 'package:pinterest_clone/features/home/domain/entities/photo_entity.dart';
import 'package:pinterest_clone/features/home/domain/repositories/photo_repository.dart';
import 'package:pinterest_clone/features/home/domain/use_cases/get_photos.dart';
import 'package:pinterest_clone/features/home/presentation/riverpod/notifiers/photo_notifier.dart';
import 'package:pinterest_clone/main_index.dart';

final photoRemoteDataSourceProvider = Provider<PhotoRemoteDataSource>((ref) {
  return PhotoRemoteDataSourceImpl();
});

final photoRepositoryProvider = Provider<PhotoRepository>((ref) {
  final remoteDataSource = ref.read(photoRemoteDataSourceProvider);
  return PhotoRepositoryImpl(remoteDataSource);
});

final photoNotifierProvider =
    StateNotifierProvider<PhotoNotifier, List<PhotoEntity>>((ref) {
      final repository = ref.watch(photoRepositoryProvider); // see below
      final useCase = GetPhotos(repository);
      return PhotoNotifier(useCase);
    });
