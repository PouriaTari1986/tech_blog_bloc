// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState {
  HomeStatus homeStatus;
  HomeState({
    required this.homeStatus,
  });
  
  HomeState copyWith(
    HomeStatus? newStatus
  ){
    return HomeState(homeStatus: newStatus?? homeStatus);
  }
}
