import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_bloc/core/utils/routes/main_shell.dart';
import 'package:tech_bloc/core/utils/routes/route_names.dart';
import 'package:tech_bloc/features/articles/list_article/presentation/list_article_bloc/bloc/list_articles_bloc.dart';
import 'package:tech_bloc/features/articles/list_article/presentation/list_article_pages/list_article_screen.dart';
import 'package:tech_bloc/features/authentication/presentation/bloc/cubit/interesed/intrerested_cubit.dart';

import 'package:tech_bloc/features/authentication/presentation/pages/register_intro_screen.dart';
import 'package:tech_bloc/features/authentication/presentation/pages/register_screen.dart';
import 'package:tech_bloc/features/home/presentation/home_bloc/bloc/bloc/home_bloc.dart';
import 'package:tech_bloc/features/home/presentation/home_pages/home_screen.dart';
import 'package:tech_bloc/features/splash/splash_screen.dart';
import 'package:tech_bloc/features/authentication/presentation/pages/user_screen.dart';
import 'package:tech_bloc/injections.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: NamedScreen.splashScreen,
      name: NamedScreen.splashScreenName,
      builder: (context, state) => const SplashScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return MainShell(child: child);
      },
      routes: [
        GoRoute(
          path: NamedScreen.homeScreen,
          name: NamedScreen.homeScreenName,

          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => locator<HomeBloc>()..add(LoadEvent()),
              ),
            ],
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          path: NamedScreen.userSreen,
          name: NamedScreen.userScreenName,
          builder: (context, state) => UserScreen(),
        ),
      ],
    ),
    GoRoute(
      path: NamedScreen.articleList,
      name: NamedScreen.articleListName,

      builder: (context, state) {
        final title = state.extra as String;
        return BlocProvider(
          create: (context) => locator<ListArticlesBloc>(),
          child: ListArticleScreen(text: title),
        );
      },
    ),
    GoRoute(
      path: NamedScreen.registerIntro,
      name: NamedScreen.registerIntoName,

      builder: (context, state) {
        return RegisterIntroScreen();
      },
    ),
    GoRoute(
      name: NamedScreen.registerScreenName,
      path: NamedScreen.registerScreen,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => locator<InterestsCubit>()..loadData(),
          child: RegisterScreen(),
        );
      },
    ),
  ],
);
