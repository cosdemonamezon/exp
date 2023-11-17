import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  News(this.id, this.title, this.detail, this.image, this.status);

  int id;
  String? title;
  String? detail;
  String? image;
  int? status;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
