import 'package:tech_bloc/features/podcasts/list_podcast/domain/list_podcast_entity.dart';

class ListPodcastModel extends ListPodcastEntity{


  const ListPodcastModel({
      
  super.id,
  super.title,
  super.poster,
  super.publisher,
  super.view,
  super.status,
  super.createdAt,
  super.isFavorite,});

  factory ListPodcastModel.fromJson(Map<String, dynamic> json) {

    return ListPodcastModel(
      id: json['id'],
      title: json['title'],
      poster: json['poster'],
      publisher: json['publisher'],
      view: json['view'],
      status: json['status'],
      createdAt: json['created_at'],
      isFavorite: json['isFavorite']
    );


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['poster'] = poster;
    data['publisher'] = publisher;
    data['view'] = view;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['isFavorite'] = isFavorite;
    return data;
  }
}
