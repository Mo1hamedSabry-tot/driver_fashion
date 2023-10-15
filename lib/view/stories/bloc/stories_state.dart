part of 'stories_bloc.dart';

sealed class StoriesState extends Equatable {
  const StoriesState();

  @override
  List<Object> get props => [];
}

final class StoriesInitial extends StoriesState {}

//? get stories event
final class GetStoriesLoadingState extends StoriesState {}

final class GetStoriesSuccessState extends StoriesState {}

final class GetStoriesFailureState extends StoriesState {}
