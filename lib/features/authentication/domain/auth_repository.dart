import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/authentication/domain/auth_entity.dart';


abstract class AuthRepository {

  Future<DataState<AuthEntity>> registerEmail({
    required String email,
    required String command,
  });

  Future<DataState<AuthEntity>> verifyCode({
    required String email,
    required String userId,
    required String code,
    required String command,
  });
}