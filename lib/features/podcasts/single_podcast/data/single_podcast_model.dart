import 'package:tech_bloc/features/podcasts/single_podcast/domain/single_podcast_entity.dart';

class SinglePodcastModel extends SinglePodcastEntity{


  const SinglePodcastModel({
  super.id,
  super.title,
  super.poster,
  super.catId,
  super.catName,
  super.author,
  super.view,
  super.status,
  super.createdAt,});

 factory SinglePodcastModel.fromJson(Map<String, dynamic> json) {

  return SinglePodcastModel(
    id: json['id'],
    title: json['title'],
    poster:  json['poster'],
    catId: json['cat_id'],
    catName: json['cat_name'],
    author: json['author'],
    view: json['view'],
    status: json['status'],
    createdAt: json['created_at']
    );
  
 }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['poster'] = poster;
    data['cat_id'] = catId;
    data['cat_name'] = catName;
    data['author'] = author;
    data['view'] = view;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}
