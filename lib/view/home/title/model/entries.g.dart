// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entries _$EntriesFromJson(Map<String, dynamic> json) => Entries(
      id: json['id'] as String?,
      body: json['body'] as String?,
      author: json['author'] as String?,
      authorId: json['authorId'] as String?,
      favCount: json['favCount'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$EntriesToJson(Entries instance) => <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'author': instance.author,
      'authorId': instance.authorId,
      'favCount': instance.favCount,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
