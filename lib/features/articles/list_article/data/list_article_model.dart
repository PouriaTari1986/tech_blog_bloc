import 'package:dartz/dartz.dart';
import 'package:tech_bloc/features/articles/list_article/domain/list_article_entity.dart';

// ignore: must_be_immutable
class ListArticleModel extends ListArticleEntity{


 // ignore: use_super_parameters
 const ListArticleModel({
  String? id,
  String? title,
  String? image,
  String? catId,
  String? catName,
  String? author,
  String? view,
  String? status,
  bool? isFavorite,
  String? createdAt}):super(
        author: author,
        id: id,
        title: title,
        image: image,
        catId: catId,
        catName: catName,
        view: view,
        status: status,
        isFavorite: isFavorite,
        createdAt: createdAt
      );

  factory ListArticleModel.fromJson(Map<String, dynamic> json) {

    return ListArticleModel(
      image: json['image'],
      view: json['view'],
      id: json['id'],
      title: json['title'],
      catId: json['cat_id'],
      catName: json['cat_name'],
      author: json['author'],
      status: json['status'],
      isFavorite: json['isFavorite'],
      createdAt: json['created_at']
    );


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['cat_id'] = catId;
    data['cat_name'] = catName;
    data['author'] = author;
    data['view'] = view;
    data['status'] = status;
    data['isFavorite'] = isFavorite;
    data['created_at'] = createdAt;
    return data;
  }
}
