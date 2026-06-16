// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:tech_bloc/features/articles/single_article/data/single_article_model.dart';

class SingleArticleEntity extends Equatable {
  final Info? info;
  final bool? isFavorite;
  final List<Related>? related;
  final List<Tags>? tags;
  const SingleArticleEntity({
    this.info,
    this.isFavorite,
    this.related,
    this.tags,
  });



  @override

  List<Object?> get props => [
   info,isFavorite,related,tags
  ];
}
