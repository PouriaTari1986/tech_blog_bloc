import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_bloc/features/home/domain/home_entities/home_entity.dart';
import 'package:tech_bloc/features/home/presentation/home_bloc/bloc/bloc/home_bloc.dart';
import 'package:tech_bloc/features/home/presentation/home_bloc/home_status.dart';
import 'package:tech_bloc/features/home/presentation/widgets/home_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    context.read<HomeBloc>().add(LoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {

          final status = state.homeStatus;

          if (status is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (status is HomeLoadingError) {
            return Center(
              child: Text(status.message),
            );
          }

          if (status is HomeLoaded) {

            final homeEntity = status.homeEntity;

            return _homeContent(homeEntity);
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _homeContent(HomeEntity homeEntity) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [

          SizedBox(height: 8),

          homePoster(homeEntity.poster!, size),

         const  SizedBox(height: 12),

          homeTags(homeEntity.tags!),

          SizedBox(height: size.width / 10),

          homeArticles(homeEntity.topVisited!, size),

          SizedBox(height: size.width / 10),

          homePodcasts(homeEntity.topPodcasts!, size),

          SizedBox(height: size.height / 7),
        ],
      ),
    );
  }
}