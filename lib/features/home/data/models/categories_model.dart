import 'package:tech_bloc/features/home/domain/home_entities/categories_entity.dart';


class CategoryModel extends CategoryEntity {
  const CategoryModel({
    super.id,
    super.title,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      title: json["title"],
    );
  }
}