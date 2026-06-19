// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/core/use_cases/use_case.dart';
import 'package:tech_bloc/features/podcasts/list_podcast/domain/list_podcast_entity.dart';
import 'package:tech_bloc/features/podcasts/list_podcast/domain/list_podcast_repository.dart';

 class ListPodcastUseCases implements UseCase<DataState<List<ListPodcastEntity>>,String> {
ListPodcastRepository listPodcastRepository;
  ListPodcastUseCases({
    required this.listPodcastRepository,
  });

  @override
  Future<DataState<List<ListPodcastEntity>>> call(String params){

    return listPodcastRepository.listPRepository(params);
  }

}
