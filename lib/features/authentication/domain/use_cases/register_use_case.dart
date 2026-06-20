import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/authentication/domain/auth_repostory.dart';
import 'package:tech_bloc/features/authentication/domain/entities/register_entity.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase({required this.repository});



  Future<DataState<RegisterEntity>> call(String email) {
    return repository.register(email);
  }
}