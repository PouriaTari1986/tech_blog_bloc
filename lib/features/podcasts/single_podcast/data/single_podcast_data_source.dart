


import 'package:dio/dio.dart';
import 'package:tech_bloc/core/utils/constants.dart';

class SinglePodcastDataSource {

  final Dio dio;

  SinglePodcastDataSource(this.dio);


  Future<dynamic> singlePodcastApi(

  ) async {
    var response = await dio.get(
      "${Constants.baseUrlPodcast}get.php",
      queryParameters: {}
    );
    return response.data;
  }
}