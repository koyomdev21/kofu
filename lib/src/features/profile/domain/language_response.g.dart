// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemResponse _$$_ItemResponseFromJson(Map<String, dynamic> json) =>
    _$_ItemResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      code: json['code'] as String?,
      createdAt: json['createdAt'] as String?,
      updateAt: json['updateAt'] as String?,
    );

Map<String, dynamic> _$$_ItemResponseToJson(_$_ItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'code': instance.code,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
    };

_$_ItemListResponse _$$_ItemListResponseFromJson(Map<String, dynamic> json) =>
    _$_ItemListResponse(
      item: (json['item'] as List<dynamic>?)
          ?.map((e) => ItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ItemListResponseToJson(_$_ItemListResponse instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

_$_LanguageResponse _$$_LanguageResponseFromJson(Map<String, dynamic> json) =>
    _$_LanguageResponse(
      items: json['items'] == null
          ? null
          : ItemResponse.fromJson(json['items'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$$_LanguageResponseToJson(_$_LanguageResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
      'success': instance.success,
      'count': instance.count,
    };
