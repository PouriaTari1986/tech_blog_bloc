import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/authentication/domain/auth_repostory.dart';
import 'package:tech_bloc/features/authentication/domain/entities/verify_code_entity.dart';

class VerifyCodeUseCase {
  final AuthRepository repository;

  VerifyCodeUseCase({required this.repository});



  Future<DataState<VerifyCodeEntity>> call({
    required String email,
    required String userId,
    required String code,
  }) {
    return repository.verifyCode(
      email: email,
      userId: userId,
      code: code,
    );
  }
}