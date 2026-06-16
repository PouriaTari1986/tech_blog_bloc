import 'package:dio/dio.dart';
import 'package:tech_bloc/core/utils/constants.dart';

class SingleArticleDataSource {
  final Dio dio;

  SingleArticleDataSource(this.dio);

  Future<Map<String, dynamic>> getInfoArticle(
     String articleId,
     String userId,
  ) async {
    final response = await dio.get(
      "${Constants.baseUrlArticle}get.php",
      queryParameters: {
        "command": "info",
        "id": articleId,
        "user_id": userId,
      },
    );

    return response.data;
  }
}