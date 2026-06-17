import 'package:tech_bloc/features/home/domain/home_entity.dart';

class HomeModel extends HomeEntity{


  const HomeModel(
      {  
  super.poster,
  super.topVisited,
  super.topPodcasts,
  super.tags,
  super.categories,});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
     List<Tags> tags = <Tags>[];
    if (json['tags'] != null) {
      json['tags'].forEach((v) {
        tags.add(Tags.fromJson(v));
      });
    }
     List<Categories>  categories = <Categories>[];
    if (json['categories'] != null) {    
      json['categories'].forEach((v) {
        categories.add(Categories.fromJson(v));
      });
    }
      List<TopPodcasts> topPodcasts = <TopPodcasts>[];
      if (json['top_podcasts'] != null) {     
      json['top_podcasts'].forEach((v) {
        topPodcasts.add(TopPodcasts.fromJson(v));
      });
    }
    List<TopVisited>  topVisited = <TopVisited>[];
    if (json['top_visited'] != null) {
      json['top_visited'].forEach((v) {
        topVisited.add(TopVisited.fromJson(v));
      });
    }


    return HomeModel(
      poster: json['poster'] != null ? Poster.fromJson(json['poster']) : null,
      tags: tags,
      categories: categories,
      topPodcasts: topPodcasts,
      topVisited:topVisited
    );  
    
  }

}

class Categories {
  String? id;
  String? title;

  Categories({this.id,this.title});

  Categories.fromJson(Map<String,dynamic> json){
    id = json["id"];
    title = json["title"];
  }
}

class Poster {
  String? id;
  String? title;
  String? image;

  Poster({this.id, this.title, this.image});

  Poster.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}

class TopVisited {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  TopVisited(
      {this.id,
      this.title,
      this.image,
      this.catId,
      this.catName,
      this.author,
      this.view,
      this.status,
      this.createdAt});

  TopVisited.fromJson(Map<String, dynamic> json) {
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

class TopPodcasts {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  TopPodcasts(
      {this.id,
      this.title,
      this.poster,
      this.catName,
      this.author,
      this.view,
      this.status,
      this.createdAt});

  TopPodcasts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    poster = json['poster'];
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
    data['poster'] = poster;
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
