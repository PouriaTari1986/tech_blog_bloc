part of 'list_articles_bloc.dart';

 class ListArticlesEvent {
 


}
class ListArticleLoadEvent extends ListArticlesEvent{
  final String type;

  ListArticleLoadEvent({required this.type});
}
