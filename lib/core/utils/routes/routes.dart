


import 'package:go_router/go_router.dart';
import 'package:tech_bloc/core/utils/routes/route_names.dart';
import 'package:tech_bloc/features/home/presentation/home_pages/home_screen.dart';
import 'package:tech_bloc/features/splash/splash_screen.dart';

final routes = GoRouter(

  routes: [
    GoRoute(
      path: NamedScreen.splashScreen,
      name: NamedScreen.splashScreenName,
      builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: NamedScreen.homeScreen,
        name: NamedScreen.homeScreenName,
        builder: (context, state) => const HomeScreen(),
        )
  ]
);