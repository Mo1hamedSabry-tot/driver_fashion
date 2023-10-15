import 'package:dartz/dartz.dart';

import '../../../app/core/network/error/exception.dart';
import '../../../app/core/network/error/failure.dart';
import '../../../domain/stories/entities/story_entity.dart';

abstract class StoriesRemoteDataSource {
  Future<Either<Failure, List<StoryEntity>>> loadStories();
}

class StoriesRemoteDataSourceImpl implements StoriesRemoteDataSource {
  @override
  Future<Either<Failure, List<StoryEntity>>> loadStories() async {
    List<StoryEntity> stories = [];

    try {
      for (final storyJson in _storiesJson) {
        stories.add(StoryEntity.fromJson(json: storyJson));
      }
    } on FetchDataException {
      return Left(ServerFailure());
    }
    return Right(stories);
  }
}

final List<Map<String, dynamic>> _storiesJson = [
  {
    "img_link":
        'https://images.ctfassets.net/trvmqu12jq2l/1LFP1rAaPMiEx5y11ZZv2F/5167948e81a58a08e516631e07ee154c/blog-hero-1208x1080-v115.14.01.jpg',
    "title": "Be polite when delivering the order to the customer",
  },
  {
    "img_link":
        "https://media.istockphoto.com/id/1262331996/photo/the-staff-prepares-the-delivery-box-on-the-motorcycle-for-delivery-to-customers.jpg?s=612x612&w=0&k=20&c=tvSWn2CvoZ_jKbkBsHRFKrB-FiGlCgpeWA79myIYWiY=",
    "title": "Be careful with what you are carrying",
  },
  {
    "img_link":
        'https://images.unsplash.com/photo-1566576721346-d4a3b4eaeb55?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGFja2FnZSUyMGRlbGl2ZXJ5fGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    "title": "Be polite when delivering the order to the customer",
  },
  {
    "img_link":
        'https://images.ctfassets.net/trvmqu12jq2l/1LFP1rAaPMiEx5y11ZZv2F/5167948e81a58a08e516631e07ee154c/blog-hero-1208x1080-v115.14.01.jpg',
    "title": "Be polite when delivering the order to the customer",
  },
  {
    "img_link":
        "https://media.istockphoto.com/id/1262331996/photo/the-staff-prepares-the-delivery-box-on-the-motorcycle-for-delivery-to-customers.jpg?s=612x612&w=0&k=20&c=tvSWn2CvoZ_jKbkBsHRFKrB-FiGlCgpeWA79myIYWiY=",
    "title": "Be careful with what you are carrying",
  },
  {
    "img_link":
        'https://images.unsplash.com/photo-1566576721346-d4a3b4eaeb55?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGFja2FnZSUyMGRlbGl2ZXJ5fGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    "title": "Be polite when delivering the order to the customer",
  },
];
