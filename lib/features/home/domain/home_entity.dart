

import 'package:equatable/equatable.dart';
import 'package:tech_bloc/features/home/data/home_model.dart';

class HomeEntity extends Equatable{
  final Poster? poster;
  final List<TopVisited>? topVisited;
  final List<TopPodcasts>? topPodcasts;
  final List<Tags>? tags;
  final List<Categories>? categories;

  const HomeEntity({this.poster, this.topVisited, this.topPodcasts, this.tags,this.categories});



  @override
  List<Object?> get props => [
    poster,topVisited,topPodcasts,tags,categories
  ];
}