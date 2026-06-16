

import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/articles/list_article/domain/list_article_entity.dart';

abstract class ListArticleRepository {



  Future<DataState<List<ListArticleEntity>>> listARepository(String userId);
}