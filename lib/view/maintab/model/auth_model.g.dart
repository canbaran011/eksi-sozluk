// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel()
  ..success = json['Success'] as bool?
  ..message = json['Message'] as String?
  ..data = json['Data'] == null
      ? null
      : AuthData.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
