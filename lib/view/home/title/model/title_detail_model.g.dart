// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TitleDetailModel _$TitleDetailModelFromJson(Map<String, dynamic> json) =>
    TitleDetailModel()
      ..id = json['id'] as String?
      ..disambiguationTitles = (json['disambiguationTitles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..disambiguationLinks = (json['disambiguationLinks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..title = json['title'] as String?
      ..slug = json['slug'] as String?
      ..totalPage = json['totalPage'] as int?
      ..currentPage = json['currentPage'] as int?
      ..tags =
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..entries = (json['entries'] as List<dynamic>?)
          ?.map((e) => Entries.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$TitleDetailModelToJson(TitleDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'disambiguationTitles': instance.disambiguationTitles,
      'disambiguationLinks': instance.disambiguationLinks,
      'title': instance.title,
      'slug': instance.slug,
      'totalPage': instance.totalPage,
      'currentPage': instance.currentPage,
      'tags': instance.tags,
      'entries': instance.entries,
    };
