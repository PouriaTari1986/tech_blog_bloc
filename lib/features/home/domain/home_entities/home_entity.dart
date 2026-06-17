

import 'package:equatable/equatable.dart';
import 'package:tech_bloc/features/home/domain/home_entities/categories_entity.dart';
import 'package:tech_bloc/features/home/domain/home_entities/poster_entity.dart';
import 'package:tech_bloc/features/home/domain/home_entities/tags_entity.dart';
import 'package:tech_bloc/features/home/domain/home_entities/top_podcasts_entity.dart';
import 'package:tech_bloc/features/home/domain/home_entities/top_visited_entity.dart';

class HomeEntity extends Equatable{
  final PosterEntity? poster;
  final List<ArticleEntity>? topVisited;
  final List<PodcastEntity>? topPodcasts;
  final List<TagEntity>? tags;
  final List<CategoryEntity>? categories;

  const HomeEntity({
    this.poster,
    this.topVisited,
    this.topPodcasts,
    this.tags,
    this.categories,
  });
  
  @override
  List<Object?> get props => [poster,topVisited,topPodcasts,tags,categories];
}