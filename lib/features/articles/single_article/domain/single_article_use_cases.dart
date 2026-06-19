// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/core/params/params.dart';
import 'package:tech_bloc/core/use_cases/use_case.dart';
import 'package:tech_bloc/features/articles/single_article/domain/single_article_entity.dart';
import 'package:tech_bloc/features/articles/single_article/domain/single_article_repository.dart';

class SingleArticleUseCases implements UseCase<DataState<SingleArticleEntity>,SingleArticleParams> {

  SingleArticleRepository singleArticleRepository;
  SingleArticleUseCases( 
   {required this.singleArticleRepository,}
  );


  @override
  Future<DataState<SingleArticleEntity>> call(SingleArticleParams params) {

    return singleArticleRepository.singleARepository(params.articleId,params.userId);
   
  }
}
