import 'package:bloc/bloc.dart';
import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/podcasts/list_podcast/domain/list_podcast_use_cases.dart';
import 'package:tech_bloc/features/podcasts/list_podcast/presentation/list_podcast_bloc/list_pod_status.dart';

part 'list_podcats_event.dart';
part 'list_podcats_state.dart';

class ListPodcatsBloc extends Bloc<ListPodcatsEvent, ListPodcatsState> {
  ListPodcastUseCases listPodcastUseCases;
  ListPodcatsBloc(this.listPodcastUseCases) : super(ListPodcatsState(listPodStatus: ListPodLoading() )) {
    on<ListPodcatsEvent>((event, emit)async {
     

     emit(state.copyWith(ListPodLoading()));
     
     DataState dataState = await listPodcastUseCases("");

     if (dataState is DataSuccess) {
       emit(state.copyWith(ListPodLoaded(listPodcastEntity: dataState.data)));
     }
     if (dataState is DataFailure) {
       emit(state.copyWith(ListPodError(message: "a problem accured")));
     }

    });
  }
}
