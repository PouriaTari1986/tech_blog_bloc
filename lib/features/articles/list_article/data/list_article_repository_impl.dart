import 'package:dio/dio.dart';
import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/articles/list_article/data/list_article_data_source.dart';
import 'package:tech_bloc/features/articles/list_article/data/list_article_model.dart';
import 'package:tech_bloc/features/articles/list_article/domain/list_article_entity.dart';
import 'package:tech_bloc/features/articles/list_article/domain/list_article_repository.dart';

class ListArticleRepositoryImpl extends ListArticleRepository {
  final ListArticleDataSource apiProvider;
  final String useId;

  ListArticleRepositoryImpl({required this.apiProvider,required this.useId});

  @override
  Future<DataState<List<ListArticleEntity>>> listARepository(String userId) async {
    try {
      final data = await apiProvider.getListArticles(userId);

      final articles = (data)
          .map((e) => ListArticleModel.fromJson(e))
          .toList();

      return DataSuccess<List<ListArticleEntity>>(articles);

      
    }on DioException catch (e) {
      return DataFailure(e.message.toString());
    }
  }
}