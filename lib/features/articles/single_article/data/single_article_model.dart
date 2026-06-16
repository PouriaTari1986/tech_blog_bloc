import 'package:tech_bloc/features/articles/single_article/domain/single_article_entity.dart';

class SingleArticleModel extends SingleArticleEntity{


 // ignore: use_super_parameters
 const SingleArticleModel({  
  Info? info,
  bool? isFavorite,
  List<Related>? related,
  List<Tags>? tags,}):super(
    info: info,
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
      info: json['info'] != null ? Info.fromJson(json['info']) : null,
      isFavorite: json['isFavorite'],
      related: related,
      tags: tags


    );
  


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    data['isFavorite'] = isFavorite;
    if (related != null) {
      data['related'] = related!.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  Info(
      {this.id,
      this.title,
      this.content,
      this.image,
      this.catId,
      this.catName,
      this.author,
      this.view,
      this.status,
      this.createdAt});

  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
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
    data['content'] = content;
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
