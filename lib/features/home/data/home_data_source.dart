// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:dio/dio.dart';
import 'package:tech_bloc/core/utils/constants.dart';

class HomeDataSource {

  final Dio dio;
  HomeDataSource({
    required this.dio,
  });

  Future<Map<String,dynamic>> getHomeItems()async{

    final response = await dio.get(Constants.homeUrl,
    queryParameters: {
      "command" : "index"
    }
    
    );
      return response.data;

  }
}
