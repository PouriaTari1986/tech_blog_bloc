part of 'verify_code_cubit.dart';

sealed class VerifyCodeState extends Equatable {
  const VerifyCodeState();

  @override
  List<Object> get props => [];
}

final class VerifyCodeInitial extends VerifyCodeState {}


final class VerifyCodeLoading extends VerifyCodeState {}


final class VerifyCodeSuccess extends VerifyCodeState {
  final VerifyCodeEntity result;


  const VerifyCodeSuccess({required this.result});}


final class VerifyCodeError extends VerifyCodeState {
  final String error;

  const VerifyCodeError({required this.error});
}
