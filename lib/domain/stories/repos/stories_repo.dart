import 'package:dartz/dartz.dart';

import '../../../app/core/network/error/failure.dart';
import '../entities/story_entity.dart';

abstract class StoriesRepo {
  Future<Either<Failure, List<StoryEntity>>> loadStories();
}
