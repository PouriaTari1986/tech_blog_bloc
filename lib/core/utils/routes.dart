


import 'package:go_router/go_router.dart';
import 'package:tech_bloc/core/utils/routes/route_names.dart';
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
        
        )
  ]
);