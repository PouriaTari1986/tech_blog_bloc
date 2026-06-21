import 'package:tech_bloc/features/home/domain/home_entities/home_tags_entity.dart';


class TagModel extends TagEntity {
  const TagModel({
    super.id,
    super.title,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json["id"],
      title: json["title"],
    );
  }
}