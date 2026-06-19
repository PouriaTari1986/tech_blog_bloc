// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

import 'package:tech_bloc/features/home/domain/home_entities/home_entity.dart';

@immutable
abstract class HomeStatus {

}
class HomeLoading extends HomeStatus{}


class HomeLoaded extends HomeStatus {
final HomeEntity homeEntity;
  HomeLoaded(
     this.homeEntity,
  );
}


class HomeLoadingError extends HomeStatus {
  final String message;
  HomeLoadingError({
    required this.message,
  });


}
