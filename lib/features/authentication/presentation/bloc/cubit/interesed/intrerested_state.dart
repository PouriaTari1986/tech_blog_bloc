part of 'intrerested_cubit.dart';

abstract class InterestsState {}

class InterestsInitial extends InterestsState {}

class InterestsLoading extends InterestsState {}

class InterestsLoaded extends InterestsState {
  final List<CategoryEntity> categories;
  final List<TagEntity> tags;

  InterestsLoaded({
    required this.categories,
    required this.tags,
  });
}

class InterestsError extends InterestsState {
  final String message;

  InterestsError(this.message);
}