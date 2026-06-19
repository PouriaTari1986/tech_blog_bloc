

import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/authentication/domain/auth_entity.dart';
import 'package:tech_bloc/features/authentication/domain/auth_repository.dart';

class VerifyCodeUseCase {

  final AuthRepository repository;

  VerifyCodeUseCase(this.repository);

  
  Future<DataState<AuthEntity>> call({
    required String email,
    required String userId,
    required String code,
  }) {
    return repository.verifyCode(
      email: email,
      userId: userId,
      code: code,
      command: "verify",
    );
  }
}