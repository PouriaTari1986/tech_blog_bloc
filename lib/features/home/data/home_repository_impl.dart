// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/home/data/home_data_source.dart';
import 'package:tech_bloc/features/home/data/home_model.dart';
import 'package:tech_bloc/features/home/domain/home_entities/home_entity.dart';
import 'package:tech_bloc/features/home/domain/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeDataSource apiProvider;
  HomeRepositoryImpl({required this.apiProvider});

  @override
  Future<DataState<HomeEntity>> homeRepository() async {
    try {
      final response = await apiProvider.getHomeItems();

      final homeItems = HomeModel.fromJson(response);

      return DataSuccess(homeItems);
    }on DioException catch (e) {
      return DataFailure(e.message.toString());
    }
  }
}
