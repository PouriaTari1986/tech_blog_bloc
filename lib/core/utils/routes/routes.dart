import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_bloc/core/utils/routes/main_shell.dart';
import 'package:tech_bloc/core/utils/routes/route_names.dart';
import 'package:tech_bloc/features/home/presentation/home_bloc/bloc/bloc/home_bloc.dart';
import 'package:tech_bloc/features/home/presentation/home_pages/home_screen.dart';
import 'package:tech_bloc/features/splash/splash_screen.dart';
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

          builder: (context, state) => BlocProvider(
            create: (_) => locator<HomeBloc>()..add(LoadEvent()),
            child: const HomeScreen(),
          ),
        ),
      ],
    ),
  ],
);
