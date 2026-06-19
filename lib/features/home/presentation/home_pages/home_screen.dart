import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_bloc/core/utils/const.dart';
import 'package:tech_bloc/core/utils/light_text_theme.dart';
import 'package:tech_bloc/core/utils/routes/route_names.dart';
import 'package:tech_bloc/features/home/domain/home_entities/home_entity.dart';
import 'package:tech_bloc/features/home/presentation/home_bloc/bloc/bloc/home_bloc.dart';
import 'package:tech_bloc/features/home/presentation/home_bloc/home_status.dart';
import 'package:tech_bloc/features/home/presentation/widgets/home_widgets.dart';
import 'package:tech_bloc/gen/assets.gen.dart';

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

          InkWell(
            onTap: () {
              context.pushNamed(NamedScreen.articleListName,
              extra: AppStrings.articleList
              );
            },
            child: Padding(
              padding:  EdgeInsets.fromLTRB(2, 0, size.width/10, 10),
              child: Row(
                children: [
                  Assets.images.write.image(scale: 1.5),
                  SizedBox(width: 8,),
                  Text(AppStrings.hottestArticle,style: LightTextTheme.blueText,)
                ],
              ),
            ),
          ),

          homeArticles(homeEntity.topVisited!, size),

          SizedBox(height: size.width / 10),

                    InkWell(
            onTap: () {
              
            },
            child: Padding(
              padding:  EdgeInsets.fromLTRB(0, 0, size.width/10, 10),
              child: Row(
                children: [
                  Assets.images.podcast.image(scale: 1.5),
                  SizedBox(width: 8,),
                  Text(AppStrings.hottestPodcats,style: LightTextTheme.blueText,)
                ],
              ),
            ),
          ),

          homePodcasts(homeEntity.topPodcasts!, size),

          SizedBox(height: size.height / 7),
        ],
      ),
    );
  }
}