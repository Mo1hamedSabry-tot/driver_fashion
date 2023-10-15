part of 'stories_bloc.dart';

sealed class StoriesEvent extends Equatable {
  const StoriesEvent();

  @override
  List<Object> get props => [];
}

final class GetStoriesEvent extends StoriesEvent {}
