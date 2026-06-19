import 'package:bloc/bloc.dart';
import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/core/use_cases/use_case.dart';
import 'package:tech_bloc/features/home/domain/home_use_cases.dart';
import 'package:tech_bloc/features/home/presentation/home_bloc/home_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeUseCases homeUseCases;

  HomeBloc(this.homeUseCases) : super(HomeState(homeStatus: HomeLoading())) {
    on<LoadEvent>((event, emit) async {

      emit(state.copyWith(HomeLoading()));

      DataState dataState = await homeUseCases(NoParams());

      if (dataState is DataSuccess) {

        emit(state.copyWith(HomeLoaded(dataState.data)));
        
      } else if(dataState is DataFailure){
        
        emit(state.copyWith(HomeLoadingError(message: dataState.error!)));
        
      }

    });
  }
}
