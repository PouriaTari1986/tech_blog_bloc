import 'package:bloc/bloc.dart';
import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/features/articles/list_article/domain/list_article_use_cases.dart';
import 'package:tech_bloc/features/articles/list_article/presentation/list_article_bloc/list_article_status.dart';

part 'list_articles_event.dart';
part 'list_articles_state.dart';

class ListArticlesBloc extends Bloc<ListArticlesEvent, ListArticlesState> {
  ListArticleUseCases listArticleUseCases;
  ListArticlesBloc(this.listArticleUseCases) : super(ListArticlesState(listArticleStatus: ListArticleLoading())) {
    on<ListArticlesEvent>((event, emit) async{
      emit(state.copyWith(ListArticleLoading()));


      DataState dataState = await listArticleUseCases("");

      if (dataState is DataSuccess) {
        emit(state.copyWith(ListArticleLoaded(listArticleEntity: dataState.data)));
      }
      if (dataState is DataFailure) {
        emit(state.copyWith(ListArticleError(message: 'A Problem Accured')));
      }
    });
  }
}
