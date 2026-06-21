import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/authentication/domain/auth_repostory.dart';
import 'package:tech_bloc/features/home/domain/home_entities/home_tags_entity.dart';

class GetTagsUseCase {
  final AuthRepository repository;

  GetTagsUseCase({required this.repository});

  

  Future<DataState<List<TagEntity>>> call() {
    return repository.getTags();
  }
}