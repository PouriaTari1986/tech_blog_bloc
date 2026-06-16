import 'package:tech_bloc/features/articles/single_article/domain/single_article_entity.dart';

class SingleArticleModel extends SingleArticleEntity{


 // ignore: use_super_parameters
 const SingleArticleModel({  
  String? id,
  String? title,
  String? content,
  String? image,
  String? catId,
  String? catName,
  String? author,
  String? view,
  String? status,
  String? createdAt,
  bool? isFavorite,
  List<Related>? related,
  List<Tags>? tags,}):super(
    id: id,
    title: title,
    content: content,
    image: image,
    catId: catId,
    catName: catName,
    author: author,
    view: view,
    status: status,
    createdAt: createdAt,
    isFavorite: isFavorite,
    related: related,
    tags: tags
    );

  factory SingleArticleModel.fromJson(Map<String, dynamic> json) {
    List<Related> related = [];
      if (json['related'] != null) {
      json['related'].forEach((v) {
        related.add(Related.fromJson(v));
      });
    }
    List<Tags> tags = <Tags>[];
        if (json['tags'] != null) {

      json['tags'].forEach((v) {
        tags.add(Tags.fromJson(v));
      });
    }
    return SingleArticleModel(
      id: json['info']['id'] ,
      title: json['info']['title'],
      image: json['info']['image'],
      content: json['info']['content'],
      catId: json['info']['cat_id'],
      catName: json['info']['cat_name'],
      author: json['info']['author'],
      view: json['info']['view'],
      status: json['info']['status'],
      createdAt: json['info']['created_at'] ,
      isFavorite: json['isFavorite'],
      related: related,
      tags: tags


    );
  


  }





}

class Related {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  Related(
      {this.id,
      this.title,
      this.image,
      this.catId,
      this.catName,
      this.author,
      this.view,
      this.status,
      this.createdAt});

  Related.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    catId = json['cat_id'];
    catName = json['cat_name'];
    author = json['author'];
    view = json['view'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['cat_id'] = catId;
    data['cat_name'] = catName;
    data['author'] = author;
    data['view'] = view;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}

class Tags {
  String? id;
  String? title;

  Tags({this.id, this.title});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
