import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tech_bloc/features/articles/list_article/data/list_article_data_source.dart';
import 'package:tech_bloc/features/articles/list_article/data/list_article_repository_impl.dart';
import 'package:tech_bloc/features/articles/list_article/domain/list_article_repository.dart';
import 'package:tech_bloc/features/articles/list_article/domain/list_article_use_cases.dart';
import 'package:tech_bloc/features/articles/list_article/presentation/list_article_bloc/bloc/list_articles_bloc.dart';
import 'package:tech_bloc/features/articles/single_article/data/single_article_data_source.dart';
import 'package:tech_bloc/features/articles/single_article/data/single_article_repository_impl.dart';
import 'package:tech_bloc/features/articles/single_article/domain/single_article_repository.dart';
import 'package:tech_bloc/features/articles/single_article/domain/single_article_use_cases.dart';
import 'package:tech_bloc/features/articles/single_article/presentation/single_article_bloc/bloc/article_info_bloc.dart';
import 'package:tech_bloc/features/authentication/data/data_source/auth_data_source.dart';
import 'package:tech_bloc/features/authentication/data/data_source/auth_local_data_source.dart';
import 'package:tech_bloc/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:tech_bloc/features/authentication/domain/auth_repository.dart';
import 'package:tech_bloc/features/authentication/domain/auth_use_case.dart';
import 'package:tech_bloc/features/authentication/domain/code_use_case.dart';
import 'package:tech_bloc/features/authentication/presentation/bloc/cubit/authentication_cubit.dart';
import 'package:tech_bloc/features/home/data/home_data_source.dart';
import 'package:tech_bloc/features/home/data/home_repository_impl.dart';
import 'package:tech_bloc/features/home/domain/home_repository.dart';
import 'package:tech_bloc/features/home/domain/home_use_cases.dart';
import 'package:tech_bloc/features/home/presentation/home_bloc/bloc/bloc/home_bloc.dart';
import 'package:tech_bloc/features/podcasts/list_podcast/data/list_podcast_data_source.dart';
import 'package:tech_bloc/features/podcasts/list_podcast/data/list_podcast_repository_impl.dart';
import 'package:tech_bloc/features/podcasts/list_podcast/domain/list_podcast_repository.dart';
import 'package:tech_bloc/features/podcasts/list_podcast/domain/list_podcast_use_cases.dart';
import 'package:tech_bloc/features/podcasts/list_podcast/presentation/list_podcast_bloc/bloc/list_podcats_bloc.dart';

GetIt locator = GetIt.instance;

 // ignore: strict_top_level_inference
 setup()async{

  locator.registerSingleton<Dio>(Dio());

  ///share prefrences



  locator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(),
  );



  ///Api Providers
  locator.registerSingleton<HomeDataSource>(HomeDataSource(dio: locator()));

  locator.registerSingleton<ListPodcastDataSource>(ListPodcastDataSource(dio: locator()));
  locator.registerFactory<SingleArticleDataSource>(()=>SingleArticleDataSource(dio: locator()));
  locator.registerSingleton<ListArticleDataSource>(ListArticleDataSource(dio: locator()));
  locator.registerFactory<AuthDataSource>(()=>AuthDataSource(locator()));


  ///repositoris
  locator.registerSingleton<HomeRepository>(HomeRepositoryImpl(apiProvider: HomeDataSource(dio: locator())));
  locator.registerSingleton<ListPodcastRepository>(ListPodcastRepositoryImpl(apiProvider: ListPodcastDataSource(dio: locator())));
  locator.registerSingleton<SingleArticleRepository>(SingleArticleRepositoryImpl(apiProvider: locator()));
  locator.registerSingleton<ListArticleRepository>(ListArticleRepositoryImpl(apiProvider: locator(), useId: ''));
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(locator()));


  ///use cases
  locator.registerSingleton<HomeUseCases>(HomeUseCases(homeRepository: locator()));
  locator.registerSingleton<ListPodcastUseCases>(ListPodcastUseCases(listPodcastRepository: locator()));
  locator.registerSingleton<SingleArticleUseCases>(SingleArticleUseCases(singleArticleRepository: locator()));
  locator.registerSingleton<ListArticleUseCases>(ListArticleUseCases(listArticleRepository: locator()));
  locator.registerSingleton<RegisterEmailUseCase>(RegisterEmailUseCase(locator()));
  locator.registerSingleton<VerifyCodeUseCase>(VerifyCodeUseCase(locator()));



  ///blocs
  locator.registerFactory<HomeBloc>(()=>HomeBloc(locator()));
  locator.registerFactory<ListPodcatsBloc>(()=>ListPodcatsBloc(locator()));
  locator.registerFactory<ArticleInfoBloc>(()=>ArticleInfoBloc(locator()));
  locator.registerFactory<ListArticlesBloc>(()=>ListArticlesBloc(locator()));
  locator.registerFactory<AuthCubit>(()=>AuthCubit(locator(), locator(), locator()));
  


}