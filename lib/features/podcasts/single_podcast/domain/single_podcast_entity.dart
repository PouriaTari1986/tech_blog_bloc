

import 'package:equatable/equatable.dart';

class SinglePodcastEntity extends Equatable{
 final String? id;
 final String? title;
 final String? poster;
 final String? catId;
 final String? catName;
 final String? author;
 final String? view;
 final String? status;
 final String? createdAt;

  const SinglePodcastEntity({
    this.id, 
    this.title, 
    this.poster, 
    this.catId, 
    this.catName, 
    this.author, 
    this.view, 
    this.status, 
    this.createdAt});


  @override
  List<Object?> get props => [
    id,title,poster,catId,catName,author,view,status,createdAt
  ];
}