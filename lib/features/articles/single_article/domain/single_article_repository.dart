


import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/articles/single_article/domain/single_article_entity.dart';

abstract class SingleArticleRepository {


  Future<DataState<SingleArticleEntity>> singleARepository(String articleId,String userId);
}