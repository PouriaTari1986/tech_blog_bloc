import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/authentication/domain/auth_repostory.dart';
import 'package:tech_bloc/features/home/domain/home_entities/categories_entity.dart';

class GetCategoriesUseCase {
  final AuthRepository repository;

  GetCategoriesUseCase({required this.repository});



  Future<DataState<List<CategoryEntity>>> call() {
    return repository.getCategories();
  }
}