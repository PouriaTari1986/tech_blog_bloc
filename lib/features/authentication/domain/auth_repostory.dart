import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/authentication/domain/entities/register_entity.dart';
import 'package:tech_bloc/features/authentication/domain/entities/user_entity.dart';
import 'package:tech_bloc/features/authentication/domain/entities/verify_code_entity.dart';
import 'package:tech_bloc/features/home/domain/home_entities/categories_entity.dart';
import 'package:tech_bloc/features/home/domain/home_entities/tags_entity.dart';

abstract class AuthRepository {

  Future<DataState<RegisterEntity>> register(String email);

  Future<DataState<VerifyCodeEntity>> verifyCode({
    required String email,
    required String userId,
    required String code,
  });

  Future<DataState<UserEntity>> getUser(String userId);

  Future<void> updateUser({
    required String userId,
    required String name,
  });

  Future<DataState<List<CategoryEntity>>> getCategories();

  Future<DataState<List<TagEntity>>> getTags();
}