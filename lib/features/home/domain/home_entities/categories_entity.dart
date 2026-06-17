import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable{
  final String? id;
  final String? title;

  const CategoryEntity({
    this.id,
    this.title,
  });
  
  @override
  List<Object?> get props => [id,title];
}