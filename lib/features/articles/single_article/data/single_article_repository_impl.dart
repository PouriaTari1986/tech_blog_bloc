// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:dio/dio.dart';
import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/articles/single_article/data/single_article_data_source.dart';
import 'package:tech_bloc/features/articles/single_article/data/single_article_model.dart';
import 'package:tech_bloc/features/articles/single_article/domain/single_article_entity.dart';
import 'package:tech_bloc/features/articles/single_article/domain/single_article_repository.dart';

class SingleArticleRepositoryImpl extends SingleArticleRepository {

  SingleArticleDataSource apiProvider;
  SingleArticleRepositoryImpl(
     this.apiProvider,
  );


  @override
  Future<DataState<SingleArticleEntity>> singleARepository(String articleId, String userId)async {
    
    try {

      final response = await apiProvider.getInfoArticle(articleId, userId);

      final article = SingleArticleModel.fromJson(response);

      return DataSuccess(article);
      
      
    }on DioException
     catch (e) {
      return DataFailure(e.message.toString());
    }

  }
}
