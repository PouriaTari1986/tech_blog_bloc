// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'article_info_bloc.dart';

class ArticleInfoState {

  ArticleInfoStatus articleInfoStatus;
  ArticleInfoState({
    required this.articleInfoStatus,
  });

  ArticleInfoState copyWith(
    ArticleInfoStatus? newStatus
  ){
    return ArticleInfoState(articleInfoStatus: newStatus?? articleInfoStatus);
  }

}


