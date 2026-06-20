part of 'user_cubit.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserEntity user;

  UserSuccess(this.user);
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}