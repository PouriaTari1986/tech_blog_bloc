import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/authentication/domain/auth_repostory.dart';
import 'package:tech_bloc/features/authentication/domain/entities/user_entity.dart';

class GetUserUseCase {
  final AuthRepository repository;

  GetUserUseCase({required this.repository});

 

  Future<DataState<UserEntity>> call(String userId) {
    return repository.getUser(userId);
  }
}