// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/podcasts/list_podcast/data/list_podcast_data_source.dart';
import 'package:tech_bloc/features/podcasts/list_podcast/data/list_podcast_model.dart';
import 'package:tech_bloc/features/podcasts/list_podcast/domain/list_podcast_entity.dart';
import 'package:tech_bloc/features/podcasts/list_podcast/domain/list_podcast_repository.dart';

class ListPodcastRepositoryImpl implements ListPodcastRepository {

  ListPodcastDataSource apiProvider;
  ListPodcastRepositoryImpl({
    required this.apiProvider,
  });


  @override
  Future<DataState<List<ListPodcastEntity>>> listPRepository(String userId) async{
    
    try {
      final response = await apiProvider.listPodcastApiProvider(userId);
      final podcasts = (response).map((e)=>ListPodcastModel.fromJson(e)).toList();

      return DataSuccess<List<ListPodcastEntity>>(podcasts);
    } catch (e) {
      return DataFailure("error");
    }
  }
}
