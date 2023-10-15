import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/stories/entities/story_entity.dart';
import '../../../domain/stories/repos/stories_repo.dart';

part 'stories_event.dart';
part 'stories_state.dart';

class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  List<StoryEntity> stories = [];
  void _handleGetStories(Emitter<StoriesState> emit) async {
    emit(GetStoriesLoadingState());

    final res = await _storiesRepo.loadStories();

    res.fold(
      (failure) {
        emit(GetStoriesFailureState());
      },
      (loadedStories) {
        stories = loadedStories;
        emit(GetStoriesSuccessState());
      },
    );
  }

  final StoriesRepo _storiesRepo;
  StoriesBloc({required StoriesRepo storiesRepo})
      : _storiesRepo = storiesRepo,
        super(StoriesInitial()) {
    on<StoriesEvent>((event, emit) {
      return switch (event) {
        GetStoriesEvent() => _handleGetStories(emit),
      };
    });
  }
}
