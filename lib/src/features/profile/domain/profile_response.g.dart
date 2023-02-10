// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileResponse _$$_ProfileResponseFromJson(Map<String, dynamic> json) =>
    _$_ProfileResponse(
      item: json['item'] == null
          ? null
          : ItemResponse.fromJson(json['item'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as int?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_ProfileResponseToJson(_$_ProfileResponse instance) =>
    <String, dynamic>{
      'item': instance.item,
      'statusCode': instance.statusCode,
      'success': instance.success,
      'message': instance.message,
    };
