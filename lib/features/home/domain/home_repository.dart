


import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/home/domain/home_entity.dart';

abstract class HomeRepository {

  Future<DataState<HomeEntity>> homeRepository();
}