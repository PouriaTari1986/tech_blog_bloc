// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_podcats_bloc.dart';

class ListPodcatsState {

  ListPodStatus listPodStatus;
  ListPodcatsState({
    required this.listPodStatus,
  });

  ListPodcatsState copyWith(
    ListPodStatus? newStatus
  ){
    return ListPodcatsState(listPodStatus: newStatus?? listPodStatus);
  }
}


