import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/authentication/data/data_source/auth_local_data_source.dart';
import 'package:tech_bloc/features/authentication/domain/auth_use_case.dart';
import 'package:tech_bloc/features/authentication/domain/code_use_case.dart';

part 'authentication_state.dart';




class AuthCubit extends Cubit<AuthState> {

  final RegisterEmailUseCase registerEmailUseCase;
  final VerifyCodeUseCase verifyCodeUseCase;
  final AuthLocalDataSource localDataSource;

  AuthCubit(
    this.registerEmailUseCase,
    this.verifyCodeUseCase,
    this.localDataSource,
  ) : super(AuthInitial());

  Future<void> verifyCode({
    required String email,
    required String userId,
    required String code,
  }) async {

    emit(AuthLoading());

    final result = await verifyCodeUseCase(
      email: email,
      userId: userId,
      code: code,
    );

    if (result is DataSuccess) {

      await localDataSource.saveUserId(
        result.data?.userId ?? "",
      );

      await localDataSource.saveToken(
        result.data?.token ?? "",
      );
      debugPrint(localDataSource.getToken().toString());

      emit(
        VerifySuccess(
          result.data?.token ?? "",
          
        ),
        
      );
    }
  }
}