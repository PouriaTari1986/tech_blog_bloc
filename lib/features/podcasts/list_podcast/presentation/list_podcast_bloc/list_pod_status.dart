// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/foundation.dart';

import 'package:tech_bloc/features/podcasts/list_podcast/domain/list_podcast_entity.dart';

@immutable
abstract class ListPodStatus {}


class ListPodLoading extends ListPodStatus{}

class ListPodLoaded extends ListPodStatus {
 final ListPodcastEntity listPodcastEntity;
  ListPodLoaded({
    required this.listPodcastEntity,
  });
}
class ListPodError extends ListPodStatus{
  final String message;

  ListPodError({required this.message});
}
