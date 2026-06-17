import 'package:equatable/equatable.dart';

class PodcastEntity extends Equatable{
  final String? id;
  final String? title;
  final String? poster;
  final String? catName;
  final String? author;
  final String? view;

  const PodcastEntity({
    this.id,
    this.title,
    this.poster,
    this.catName,
    this.author,
    this.view,
  });
  
  @override
  List<Object?> get props =>[id,title,poster,catName,author,view];
}