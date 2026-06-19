// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:tech_bloc/features/articles/single_article/domain/single_article_entity.dart';

@immutable
class ArticleInfoStatus {}


class ArticleinfoLoading extends ArticleInfoStatus{}


class ArticleinfoLoaded extends ArticleInfoStatus {
final  SingleArticleEntity singleArticleEntity;
  ArticleinfoLoaded({
    required this.singleArticleEntity,
  });
}


class ArticleinfoError extends ArticleInfoStatus {

  final String message;
  ArticleinfoError({
    required this.message,
  });
}
