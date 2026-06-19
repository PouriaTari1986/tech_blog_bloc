
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_bloc/core/utils/const.dart';
import 'package:tech_bloc/core/utils/constants.dart';
import 'package:tech_bloc/core/utils/light_text_theme.dart';
import 'package:tech_bloc/core/utils/solid_colors.dart';
import 'package:tech_bloc/core/widgets/custumize_app_bar.dart';
import 'package:tech_bloc/features/articles/list_article/presentation/list_article_bloc/bloc/list_articles_bloc.dart';
import 'package:tech_bloc/features/articles/list_article/presentation/list_article_bloc/list_article_status.dart';
import 'package:tech_bloc/gen/assets.gen.dart';

class ListArticleScreen extends StatefulWidget {
  const ListArticleScreen({super.key, required this.text});
  final String text;

  @override
  State<ListArticleScreen> createState() => _ListArticleScreenState();
}


class _ListArticleScreenState extends State<ListArticleScreen> {

  @override
  void initState() {
    context.read<ListArticlesBloc>().add(ListArticleLoadEvent(type:widget.text));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: CustomizeAppbar(text: AppStrings.articleList),

        body: BlocBuilder<ListArticlesBloc, ListArticlesState>(
          builder: (context, state) {
            debugPrint(state.listArticleStatus.runtimeType.toString());
            final status = state.listArticleStatus;

            if (status is ListArticleLoading) {
              return Center(child: CircularProgressIndicator(),);
            }
            if (status is ListArticleError) {
              return Center(child: Text(status.message));
            }
            if(status is ListArticleLoaded){
              
              final articles = status.articles;
              return ListView.builder(
                itemCount: articles.length,
                scrollDirection: .vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          width: size.width/3.9,
                          height: size.width/3.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                           
                            gradient: LinearGradient(
                              colors: GradiantsColors.topVisited,
                              begin: .topCenter,
                              end: .bottomCenter,
                            ),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: Constants.hostDl+articles[index].image!,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Assets
                                .images
                                .hvc5cGHF2XlEG5SoVuKPwBNZpBbjyfOaCwwfWf9W
                                .image(),
                            fit: .cover,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Column(children: [
                          SizedBox(
                            width: size.width/1.5,
                            child: Text(articles[index].title!,maxLines: 2,overflow: .ellipsis,
                            style: LightTextTheme.detailText,
                            )),
                          SizedBox(height: size.width/12),
                          Row(
                            
                           
                            children: [
                              Text(articles[index].author??"",style: LightTextTheme.listAuthor,),
                              SizedBox(width: size.width/6,),
                              Text(articles[index].view??"",style: LightTextTheme.listCatColor,),
                              Icon(Icons.remove_red_eye_outlined,size: 15,color: SolidColors.greyColor,)
                            ],
                          )
                        ],
                       ),
                      ],
                    ),
                  );
                },
              );
            
            }
            return SizedBox();
            
          },
        ),
      ),
    );
  }
}
