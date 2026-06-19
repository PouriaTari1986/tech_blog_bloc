import 'package:dio/dio.dart';
import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/authentication/data/data_source/auth_data_source.dart';
import 'package:tech_bloc/features/authentication/domain/auth_entity.dart';
import 'package:tech_bloc/features/authentication/domain/auth_repository.dart';



class AuthRepositoryImpl extends AuthRepository {

  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<DataState<AuthEntity>> registerEmail({
    required String email,
    required String command,
  }) async {

    try {

      final response = await dataSource.registerEmail(
        email: email,
        command: command,
      );

      return DataSuccess(response);

    } on DioException catch (e) {

      return DataFailure(e.message ?? "Error");
    }
  }

  @override
  Future<DataState<AuthEntity>> verifyCode({
    required String email,
    required String userId,
    required String code,
    required String command,
  }) async {

    try {

      final response = await dataSource.verifyCode(
        email: email,
        userId: userId,
        code: code,
        command: command,
      );

      return DataSuccess(response);

    } on DioException catch (e) {

      return DataFailure(e.message ?? "Error");
    }
  }
}

