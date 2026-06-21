  import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_bloc/core/utils/constants.dart';
import 'package:tech_bloc/core/utils/light_text_theme.dart';
import 'package:tech_bloc/core/utils/solid_colors.dart';
import 'package:tech_bloc/features/home/domain/home_entities/poster_entity.dart';
import 'package:tech_bloc/features/home/domain/home_entities/home_tags_entity.dart';
import 'package:tech_bloc/features/home/domain/home_entities/top_podcasts_entity.dart';
import 'package:tech_bloc/features/home/domain/home_entities/top_visited_entity.dart';
import 'package:tech_bloc/gen/assets.gen.dart';

SizedBox homePodcasts(
   List<PodcastEntity> podcast
  ,Size size) {
    return SizedBox(
      height: size.height / 4.1,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: podcast.length,
        scrollDirection: .horizontal,
        itemBuilder: (context, index) {
          ///podcasts items
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  0,
                  0,
                  index == 0 ? size.width / 10 : 15,
                  0,
                ),
                child: InkWell(
                  onTap: () {
                    
                  },
                  child: Container(
                    width: size.width / 2.4,
                    height: size.height / 5.5,
                  
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      gradient: LinearGradient(
                        colors: GradiantsColors.topVisited,
                        begin: .topCenter,
                        end: .bottomCenter,
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          Constants.hostDl+podcast[index].poster!,
                  
                      placeholder: (context, url) =>
                             CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                       
                          Assets.images.singlePlaceHolder.image(),
                      fit: .cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  0,
                  12,
                  index == 0 ? size.width / 10 : 15,
                  0,
                ),
                child: SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                   podcast[index].title!,
                    maxLines: 2,
                    overflow: .ellipsis,
                    style: LightTextTheme.detailText,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  SizedBox homeArticles(
   List <ArticleEntity> articles
    ,Size size) {
    return SizedBox(
      height: size.height / 4.1,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: articles.length,
        scrollDirection: .horizontal,
        itemBuilder: (context, index) {
          ///Blog Items

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  0,
                  0,
                  index == 0 ? size.width / 10 : 15,
                  0,
                ),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        
                      },
                      child: Container(
                        width: size.width / 2.4,
                        height: size.height / 5.5,
                      
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          gradient: LinearGradient(
                            colors: GradiantsColors.topVisited,
                            begin: .topCenter,
                            end: .bottomCenter,
                          ),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              Constants.hostDl+articles[index].image!,
                      
                          placeholder: (context, url) =>
                          CircularProgressIndicator(),
                              
                          errorWidget: (context, url, error) =>
                              Assets.images.singlePlaceHolder.image(),
                          fit: .cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: .spaceAround,
                        children: [
                          Text(articles[index].author??"", style: LightTextTheme.bannerTexrNormal),
                          Text(articles[index].view!, style: LightTextTheme.bannerTexrNormal),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  0,
                  12,
                  index == 0 ? size.width / 10 : 15,
                  0,
                ),
                child: SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    articles[index].title!,
                    maxLines: 2,
                    overflow: .ellipsis,
                    style: LightTextTheme.detailText,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  SizedBox homeTags(List<TagEntity> tags) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
        padding: EdgeInsets.all(12),

        itemCount: tags.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: .horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(20),
                gradient: LinearGradient(
                  colors: GradiantsColors.tags,
                  begin: .centerRight,
                  end: .centerLeft,
                ),
              ),
              child: Row(
                children: [
                  Assets.images.a1629506.image(height: 16),
                  SizedBox(width: 12),
                  Text(
                    tags[index].title!,
                    style: LightTextTheme.bannerTextBold,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Stack homePoster(
    PosterEntity poster,
    Size size) {
    return Stack(
      children: [
        InkWell(
          onDoubleTap: () {
            
          },
          child: Container(
            width: size.width / 1.19,
            height: size.height / 4.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 800),
              imageUrl:
                  Constants.hostDl+poster.image!,
              errorWidget: (context, url, error) => CircularProgressIndicator(),
              placeholder: (context, url) =>
                  Assets.images.group1.image(fit: .cover),
              fit: .cover,
            ),
          ),
        ),
        Container(
          width: size.width / 1.19,
          height: size.height / 4.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
              colors: GradiantsColors.poster,
              begin: .topCenter,
              end: .bottomCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 15,
          right: 15,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  Text(
                    poster.id!,
                    style: LightTextTheme.bannerTexrNormal,
                  ),
                  Text("Like 253", style: LightTextTheme.bannerTexrNormal),
                ],
              ),
              SizedBox(height: 8),
              Text(
                poster.title!,
                style: LightTextTheme.bannerTextBold,
              ),
            ],
          ),
        ),
      ],
    );
  }
      Widget tagsContainer(String title) {
        return Container(
              margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(20),
                gradient: LinearGradient(
                  colors: GradiantsColors.tags,
                  begin: .centerRight,
                  end: .centerLeft,
                ),
              ),
              child: Row(
                children: [
                        Assets.images.a1629506.image(height: 16),
                  SizedBox(width: 12),
                  Text(
                    title,
                    style: LightTextTheme.bannerTextBold,
                  ),
                ],
              ));
      }