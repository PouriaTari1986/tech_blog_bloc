import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String? id;
  final String? title;
  final String? image;
  final String? catId;
  final String? catName;
  final String? author;
  final String? view;
  final String? createdAt;

  const ArticleEntity({
    this.id,
    this.title,
    this.image,
    this.catId,
    this.catName,
    this.author,
    this.view,
    this.createdAt,
  });
  
  @override
  List<Object?> get props => [id,title,image,catId,catName,author,view,createdAt];
}