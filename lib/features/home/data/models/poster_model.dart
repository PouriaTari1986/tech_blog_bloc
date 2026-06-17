import 'package:tech_bloc/features/home/domain/home_entities/poster_entity.dart';


class PosterModel extends PosterEntity {
  const PosterModel({
    super.id,
    super.title,
    super.image,
  });

  factory PosterModel.fromJson(Map<String, dynamic> json) {
    return PosterModel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
    );
  }
}