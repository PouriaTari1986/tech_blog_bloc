import 'package:bloc/bloc.dart';
import 'package:tech_bloc/core/error/error_handler.dart';
import 'package:tech_bloc/core/params/params.dart';
import 'package:tech_bloc/features/articles/single_article/domain/single_article_use_cases.dart';
import 'package:tech_bloc/features/articles/single_article/presentation/single_article_bloc/article_info_status.dart';

part 'article_info_event.dart';
part 'article_info_state.dart';

class ArticleInfoBloc extends Bloc<ArticleInfoEvent, ArticleInfoState> {
  SingleArticleUseCases singleArticleUseCases;
  ArticleInfoBloc(this.singleArticleUseCases) : super(ArticleInfoState(articleInfoStatus: ArticleinfoLoading())) {
    on<ArticleInfoEvent>((event, emit)async {
      emit(state.copyWith(ArticleinfoLoading()));

      DataState dataState = await singleArticleUseCases(SingleArticleParams(articleId: '', userId: ''));
      if (dataState is DataSuccess) {
        emit(state.copyWith(ArticleinfoLoaded(singleArticleEntity: dataState.data)));
      }
      if (dataState is DataFailure) {
        emit(state.copyWith(ArticleinfoError(message: 'A Problem Accured')));
      }

    });
    
  }
}
