import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tech_bloc/core/networks/shared_prefrenes.dart';
import 'package:tech_bloc/features/authentication/domain/entities/verify_code_entity.dart';
import 'package:tech_bloc/features/authentication/domain/use_cases/verify_use_case.dart';

part 'verify_code_state.dart';

class VerifyCodeCubit
    extends Cubit<VerifyCodeState> {

  final VerifyCodeUseCase verifyCodeUseCase;

  VerifyCodeCubit(this.verifyCodeUseCase)
      : super(VerifyCodeInitial());

  Future<void> verify({
    required String email,
    required String userId,
    required String code,
  }) async {

    emit(VerifyCodeLoading());

    try {

      final result =
          await verifyCodeUseCase(
        email: email,
        userId: userId,
        code: code,
      );

      await SharedPrefManager.saveToken(
          result.data!.token);
      await SharedPrefManager.saveUserId(
          result.data!.userId
      );
      

      emit(VerifyCodeSuccess(result: result.data!));

    } catch (e) {
      emit(
        VerifyCodeError(error: e.toString()),
      );
    }
  }
}
