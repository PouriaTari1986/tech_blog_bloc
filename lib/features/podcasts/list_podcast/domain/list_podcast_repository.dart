


import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/podcasts/list_podcast/domain/list_podcast_entity.dart';

abstract class ListPodcastRepository {

  Future<DataState<List<ListPodcastEntity>>> listPRepository(String userId);
}