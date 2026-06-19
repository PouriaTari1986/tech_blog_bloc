

import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/core/use_cases/use_case.dart';
import 'package:tech_bloc/features/authentication/domain/auth_entity.dart';
import 'package:tech_bloc/features/authentication/domain/auth_repository.dart';

class RegisterEmailUseCase implements UseCase<DataState<AuthEntity>,String>{

  final AuthRepository repository;

  RegisterEmailUseCase(this.repository);

  @override
  Future<DataState<AuthEntity>> call(String email) {
    return repository.registerEmail(
      email: email,
      command: "register",
    );
  }
}