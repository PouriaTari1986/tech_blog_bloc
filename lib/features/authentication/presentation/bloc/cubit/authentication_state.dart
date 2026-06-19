part of 'authentication_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String userId;

  AuthSuccess(this.userId);
}

class VerifySuccess extends AuthState {
  final String token;

  VerifySuccess(this.token);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}