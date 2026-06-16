
import 'package:equatable/equatable.dart';

class ListPodcastEntity extends Equatable{
  final String? id;
  final String? title;
  final String? poster;
  final String? publisher;
  final String? view;
  final String? status;
  final String? createdAt;
  final bool? isFavorite;

 const ListPodcastEntity({
    this.id, 
    this.title, 
    this.poster, 
    this.publisher, 
    this.view, 
    this.status, 
    this.createdAt, 
    this.isFavorite});



  @override
  List<Object?> get props => [
    id,title,poster,publisher,view,status,createdAt,isFavorite
  ];
}