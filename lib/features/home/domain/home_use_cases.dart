// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/core/use_cases/use_case.dart';
import 'package:tech_bloc/features/home/domain/home_entities/home_entity.dart';
import 'package:tech_bloc/features/home/domain/home_repository.dart';

class HomeUseCases implements UseCase<DataState<HomeEntity>,NoParams> {

  HomeRepository homeRepository;
  HomeUseCases({
    required this.homeRepository,
  });

  @override
  Future<DataState<HomeEntity>> call(NoParams params) {

  return homeRepository.homeRepository();
  }
}
