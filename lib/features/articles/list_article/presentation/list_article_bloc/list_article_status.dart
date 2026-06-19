// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:tech_bloc/features/articles/list_article/domain/list_article_entity.dart';

@immutable
class ListArticleStatus {}


class ListArticleLoading extends ListArticleStatus{}

class ListArticleLoaded extends ListArticleStatus {

 final ListArticleEntity listArticleEntity;
  ListArticleLoaded({
    required this.listArticleEntity,
  });

}
class ListArticleError extends ListArticleStatus {
  final String message;
  ListArticleError({
    required this.message,
  });
}
