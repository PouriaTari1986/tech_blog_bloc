import 'package:dio/dio.dart';
import 'package:tech_bloc/core/utils/constants.dart';

class ListArticleDataSource {
  final Dio dio;

  ListArticleDataSource({required this.dio});

  Future<List<dynamic>> getListArticles(String userId) async {
    final response = await dio.get(
      "${Constants.baseUrlArticle}get.php",
      queryParameters: {
        "command": "new",
        "user_id": userId,
      },
    );

    return response.data;
  }
}