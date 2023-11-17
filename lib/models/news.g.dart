// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      json['id'] as int,
      json['title'] as String?,
      json['detail'] as String?,
      json['image'] as String?,
      json['status'] as int?,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'detail': instance.detail,
      'image': instance.image,
      'status': instance.status,
    };
