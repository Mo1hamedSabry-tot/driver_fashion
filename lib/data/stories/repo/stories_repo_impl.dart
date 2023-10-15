import 'package:dartz/dartz.dart';

import '../../../app/core/network/error/failure.dart';
import '../../../domain/stories/entities/story_entity.dart';
import '../../../domain/stories/repos/stories_repo.dart';
import '../data_sources/remote_data_source.dart';

class StoriesRepoImpl implements StoriesRepo {
  final StoriesRemoteDataSource _remoteDataSource;

  StoriesRepoImpl({required StoriesRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<StoryEntity>>> loadStories() async {
    // try {
    //   final stories = await _remoteDataSource.loadStories();
    //   return Right(stories);
    // } on FetchDataException {
    //   return Left(ServerFailure());
    // }
    final res = await _remoteDataSource.loadStories();

    return res.fold(
      (failure) => Left(failure),
      (stories) => Right(stories),
    );
  }
}
