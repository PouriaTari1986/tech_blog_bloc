import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import 'package:tech_bloc/features/authentication/data/data_source/api_provider.dart';
import 'package:tech_bloc/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:tech_bloc/features/authentication/domain/auth_repostory.dart';
import 'package:tech_bloc/features/authentication/domain/use_cases/get_categories_use_case.dart';
import 'package:tech_bloc/features/authentication/domain/use_cases/get_tags_use_case.dart';
import 'package:tech_bloc/features/authentication/domain/use_cases/get_user_use_case.dart';
import 'package:tech_bloc/features/authentication/domain/use_cases/register_use_case.dart';
import 'package:tech_bloc/features/authentication/domain/use_cases/verify_use_case.dart';
import 'package:tech_bloc/features/authentication/presentation/bloc/cubit/interesed/intrerested_cubit.dart';
import 'package:tech_bloc/features/authentication/presentation/bloc/cubit/register/registe_cubit.dart';
import 'package:tech_bloc/features/authentication/presentation/bloc/cubit/user/user_cubit.dart';
import 'package:tech_bloc/features/authentication/presentation/bloc/cubit/verify_code/verify_code_cubit.dart';


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

   final prefs = await SharedPreferences.getInstance();

  locator.registerSingleton<SharedPreferences>(
    prefs,
  );
 
   



  ///Api Providers
  locator.registerSingleton<HomeDataSource>(HomeDataSource(dio: locator()));

  locator.registerSingleton<ListPodcastDataSource>(ListPodcastDataSource(dio: locator()));
  locator.registerFactory<SingleArticleDataSource>(()=>SingleArticleDataSource(dio: locator()));
  locator.registerSingleton<ListArticleDataSource>(ListArticleDataSource(dio: locator()));
  locator.registerSingleton<AuthApiProvider>(AuthApiProvider(locator()));



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
  locator.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase(repository: locator()));
  locator.registerSingleton<GetTagsUseCase>(GetTagsUseCase(repository: locator()));
  locator.registerSingleton<GetUserUseCase>(GetUserUseCase(repository: locator()));
  locator.registerSingleton<RegisterUseCase>(RegisterUseCase(repository: locator()));
  locator.registerSingleton<VerifyCodeUseCase>(VerifyCodeUseCase(repository: locator()));



  ///blocs
  locator.registerFactory<HomeBloc>(()=>HomeBloc(locator()));
  locator.registerFactory<ListPodcatsBloc>(()=>ListPodcatsBloc(locator()));
  locator.registerFactory<ArticleInfoBloc>(()=>ArticleInfoBloc(locator()));
  locator.registerFactory<ListArticlesBloc>(()=>ListArticlesBloc(locator()));
  locator.registerFactory<InterestsCubit>(()=>InterestsCubit(locator(),locator()));
  locator.registerFactory<RegisterCubit>(()=>RegisterCubit(locator()));
  locator.registerFactory<UserCubit>(()=>UserCubit(locator()));
  locator.registerFactory<VerifyCodeCubit>(()=>VerifyCodeCubit(locator()));

  


}