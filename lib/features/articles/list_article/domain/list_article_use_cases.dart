// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/core/use_cases/use_case.dart';
import 'package:tech_bloc/features/articles/list_article/domain/list_article_entity.dart';
import 'package:tech_bloc/features/articles/list_article/domain/list_article_repository.dart';

class ListArticleUseCases implements UseCase<DataState<List<ListArticleEntity>>,String>{

  ListArticleRepository listArticleRepository;
  ListArticleUseCases(
    {required this.listArticleRepository,}
  );
  
  @override
  Future<DataState<List<ListArticleEntity>>> call(String params) {
  
  return listArticleRepository.listARepository(params);
  }
  




}
