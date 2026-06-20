part of 'registe_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

 class RegisterInitial extends RegisterState {}


 class RegisterLoading extends RegisterState {}


class RegisterSuccess extends RegisterState {
final String email;

  const RegisterSuccess({required this.email});

}

 class RegisterError extends RegisterState {
  final String error;

  const RegisterError({required this.error});
}
