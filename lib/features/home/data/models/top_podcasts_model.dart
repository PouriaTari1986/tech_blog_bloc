
import 'package:tech_bloc/features/home/domain/home_entities/top_podcasts_entity.dart';

class PodcastModel extends PodcastEntity {
  const PodcastModel({
    super.id,
    super.title,
    super.poster,
    super.catName,
    super.author,
    super.view,
  });

  factory PodcastModel.fromJson(Map<String, dynamic> json) {
    return PodcastModel(
      id: json["id"],
      title: json["title"],
      poster: json["poster"],
      catName: json["cat_name"],
      author: json["author"],
      view: json["view"],
    );
  }
}