import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/authentication/data/data_source/api_provider.dart';
import 'package:tech_bloc/features/authentication/domain/auth_repostory.dart';
import 'package:tech_bloc/features/authentication/domain/entities/register_entity.dart';
import 'package:tech_bloc/features/authentication/domain/entities/user_entity.dart';
import 'package:tech_bloc/features/authentication/domain/entities/verify_code_entity.dart';
import 'package:tech_bloc/features/home/domain/home_entities/categories_entity.dart';
import 'package:tech_bloc/features/home/domain/home_entities/tags_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiProvider authApiProvider;

  AuthRepositoryImpl(this.authApiProvider);

  @override
  Future<DataState<RegisterEntity>> register(String email) async {
    try {
      final response = await authApiProvider.register(email);
      return DataSuccess(response);
    } catch (e) {
      return DataFailure(e.toString());
    }
  }

  @override
  Future<DataState<VerifyCodeEntity>> verifyCode({
    required String email,
    required String userId,
    required String code,
  }) async {
    try {
      final response = await authApiProvider.verifyCode(
        email: email,
        userId: userId,
        code: code,
      );
     

      return DataSuccess(response);
    } catch (e) {
      return DataFailure(e.toString());
    }
  }

  @override
  Future<DataState<UserEntity>> getUser(String userId) async {
    try {
      final response = await authApiProvider.getUser(userId);
      return DataSuccess(response);
    } catch (e) {
      return DataFailure(e.toString());
    }
  }

  @override
  Future<void> updateUser({
    required String userId,
    required String name,
  }) async {
    await authApiProvider.updateUser(
      userId: userId,
      name: name,
    );
  }

  @override
  Future<DataState<List<CategoryEntity>>> getCategories() async {
    try {
      final response = await authApiProvider.getCategories();
      return DataSuccess(response);
    } catch (e) {
      return DataFailure(e.toString());
    }
  }

  @override
  Future<DataState<List<TagEntity>>> getTags() async {
    try {
      final response = await authApiProvider.getTags();
      return DataSuccess(response);
    } catch (e) {
      return DataFailure(e.toString());
    }
  }
}