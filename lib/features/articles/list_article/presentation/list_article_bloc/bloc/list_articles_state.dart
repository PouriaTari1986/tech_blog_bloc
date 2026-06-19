// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_articles_bloc.dart';

class ListArticlesState {

  ListArticleStatus listArticleStatus;
  ListArticlesState({
    required this.listArticleStatus,
  });

  ListArticlesState copyWith(

    ListArticleStatus? newStatus
  ){
    return ListArticlesState(listArticleStatus: newStatus ?? listArticleStatus);
  }

}


