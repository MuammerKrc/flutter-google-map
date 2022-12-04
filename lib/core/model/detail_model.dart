import 'package:flightkaracasxy/core/model/tags_model.dart';

class DetailModel {
  String? description;
  String? name;
  String? photoUrl;
  String? status;
  List<TagsModel>? tags;

  DetailModel(
      {this.description, this.name, this.photoUrl, this.status, this.tags});

  DetailModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    name = json['name'];
    photoUrl = json['photoUrl'];
    status = json['status'];
    if (json['tags'] != null) {
      tags = <TagsModel>[];
      json['tags'].forEach((v) {
        tags!.add(new TagsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = this.description;
    data['name'] = this.name;
    data['photoUrl'] = this.photoUrl;
    data['status'] = this.status;
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
