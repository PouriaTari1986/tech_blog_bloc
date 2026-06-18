import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_bloc/core/utils/const.dart';
import 'package:tech_bloc/core/utils/light_text_theme.dart';
import 'package:tech_bloc/core/utils/solid_colors.dart';
import 'package:tech_bloc/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ///appbar
              Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  SvgPicture.asset(Assets.images.threeLine, height: 25),
                  Assets.images.logo.image(height: size.height / 13.6),
                  SvgPicture.asset(Assets.images.search, height: 25),
                ],
              ),
              SizedBox(height: 8),

              ///poster
              Stack(
                children: [
                  Container(
                    width: size.width / 1.19,
                    height: size.height / 4.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: CachedNetworkImage(
                      fadeInDuration: Duration(milliseconds: 800),
                      imageUrl:
                          "https://techblog.sasansafari.com/Techblog/assets/upload/images/article/20220904181457.jpg",
                      errorWidget: (context, url, error) =>
                          CircularProgressIndicator(),
                      placeholder: (context, url) =>
                          Assets.images.group1.image(fit: .cover),
                      fit: .cover,
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
                              "ملیکا عزیزی - یک روز پیش",
                              style: LightTextTheme.bannerTexrNormal,
                            ),
                            Text(
                              "Like 253",
                              style: LightTextTheme.bannerTexrNormal,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "دوازده قدم برنامه نویسی یک دوره ی...س",
                          style: LightTextTheme.bannerTextBold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),

              ///tags
              SizedBox(
                height: 65,
                child: ListView.builder(
                  padding: EdgeInsets.all(12),

                  itemCount: 8,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: .horizontal,
                  itemBuilder: (context, index) {
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
                            "datakfakcabcbd,abc",
                            style: LightTextTheme.bannerTextBold,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: size.width / 10),

              ///top visited
              Row(
                children: [
                  SizedBox(width: size.width / 10),
                  Assets.images.write.image(height: 40),
                  SizedBox(width: 8),
                  Text(
                    AppStrings.hottestArticle,
                    style: LightTextTheme.blueText,
                  ),
                ],
              ),
              SizedBox(height: 12),

              SizedBox(
                height: size.height / 4.1,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 12,
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
                              Container(
                                width: size.width / 2.4,
                                height: size.height / 5.5,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  gradient: LinearGradient(
                                    colors: GradiantsColors.topVisited,
                                    begin: .topCenter,
                                    end: .bottomCenter,
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://techblog.sasansafari.com/Techblog/assets/upload/images/article/matebook.jpg",

                                  placeholder: (context, url) =>
                                      Assets.images.singlePlaceHolder.image(),
                                  errorWidget: (context, url, error) =>
                                      CircularProgressIndicator(),
                                  fit: .cover,
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: .spaceAround,
                                  children: [
                                    Text(
                                      "data",
                                      style: LightTextTheme.bannerTexrNormal,
                                    ),
                                    Text(
                                      "data",
                                      style: LightTextTheme.bannerTexrNormal,
                                    ),
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
                              "kjCkbsKCB.KC;ANCkqbk;bvkqBC;bc;C.acCcASCNACa/",
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
              ),
              SizedBox(height: size.width / 10),

   

              ///top podcast
              Row(
                children: [
                  SizedBox(width: size.width / 10),
                  Assets.images.write.image(height: 40),
                  SizedBox(width: 8),
                  Text(
                    AppStrings.hottestPodcats,
                    style: LightTextTheme.blueText,
                  ),
                ],
              ),
              SizedBox(height: 12),
              SizedBox(
                height: size.height / 4.1,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 12,
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
                          child: Container(
                            width: size.width / 2.4,
                            height: size.height / 5.5,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              gradient: LinearGradient(
                                colors: GradiantsColors.topVisited,
                                begin: .topCenter,
                                end: .bottomCenter,
                              ),
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://techblog.sasansafari.com/Techblog/assets/upload/images/article/matebook.jpg",

                              placeholder: (context, url) =>
                                  Assets.images.singlePlaceHolder.image(),
                              errorWidget: (context, url, error) =>
                                  CircularProgressIndicator(),
                              fit: .cover,
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
                              "kjCkbsKCB.KC;ANCkqbk;bvkqBC;bc;C.acCcASCNACa/",
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
              ),

              SizedBox(height: size.width / 10),
            ],
          ),
        ),
      ),
    );
  }
}
