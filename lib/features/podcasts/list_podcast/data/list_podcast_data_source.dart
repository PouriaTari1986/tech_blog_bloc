


import 'package:dio/dio.dart';
import 'package:tech_bloc/core/utils/constants.dart';

class ListPodcastDataSource {

  final Dio dio;
  ListPodcastDataSource({required this.dio});


  Future<List<dynamic>> listPodcastApiProvider(
    String userId
  )async{
    var response = await dio.get(
      "${Constants.baseUrlPodcast}get.php",
      queryParameters: {
        "command": "new",
        "user_id" : userId
      },
      
    );
    return response.data;
  }
 
}