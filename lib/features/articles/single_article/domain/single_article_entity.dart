// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:tech_bloc/features/articles/single_article/data/single_article_model.dart';

class SingleArticleEntity extends Equatable {
  final String? id;
  final String? title;
  final String? content;
  final String? image;
  final String? catId;
  final String? catName;
  final String? author;
  final String? view;
  final String? status;
  final String? createdAt;
  final bool? isFavorite;
  final List<Related>? related;
  final List<Tags>? tags;
  const SingleArticleEntity({
    this.id,
    this.title,
    this.content,
    this.image,
    this.catName,
    this.catId,
    this.author,
    this.view,
    this.status,
    this.createdAt,
    this.isFavorite,
    this.related,
    this.tags,
  });



  @override

  List<Object?> get props => [
   id,title,image,content,catName,catId,author,view,status,createdAt,isFavorite,related,tags
  ];
}
