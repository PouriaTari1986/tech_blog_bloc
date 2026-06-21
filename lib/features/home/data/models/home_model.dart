

import 'package:tech_bloc/features/home/data/models/categories_model.dart';
import 'package:tech_bloc/features/home/data/models/poster_model.dart';
import 'package:tech_bloc/features/home/data/models/tags_model.dart';
import 'package:tech_bloc/features/home/data/models/top_podcasts_model.dart';
import 'package:tech_bloc/features/home/data/models/top_visited_model.dart';
import 'package:tech_bloc/features/home/domain/home_entities/home_entity.dart';

class HomeModel extends HomeEntity {
  const HomeModel({
    super.poster,
    super.topVisited,
    super.topPodcasts,
    super.tags,
    super.categories,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      poster: PosterModel.fromJson(json["poster"]),

      topVisited: (json["top_visited"] as List)
          .map((e) => ArticleModel.fromJson(e))
          .toList(),

      topPodcasts: (json["top_podcasts"] as List)
          .map((e) => PodcastModel.fromJson(e))
          .toList(),

      tags: (json["tags"] as List)
          .map((e) => TagModel.fromJson(e))
          .toList(),

      categories: (json["categories"] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
    );
  }
}