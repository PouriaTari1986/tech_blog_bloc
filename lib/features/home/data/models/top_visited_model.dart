
import 'package:tech_bloc/features/home/domain/home_entities/top_visited_entity.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.id,
    super.title,
    super.image,
    super.catId,
    super.catName,
    super.author,
    super.view,
    super.createdAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      catId: json["cat_id"],
      catName: json["cat_name"],
      author: json["author"],
      view: json["view"],
      createdAt: json["created_at"],
    );
  }
}