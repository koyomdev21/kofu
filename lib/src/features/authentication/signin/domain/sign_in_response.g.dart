// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemResponse _$$_ItemResponseFromJson(Map<String, dynamic> json) =>
    _$_ItemResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      eWalletBalance: json['eWalletBalance'] as int?,
      status: json['status'] as String?,
      ownedbys: (json['ownedbys'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      allowPermissionSet: (json['allowPermissionSet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      denyPermissionSet: (json['denyPermissionSet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      allowPermission: (json['allowPermission'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      denyPermission: (json['denyPermission'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdBy: json['createdBy'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_ItemResponseToJson(_$_ItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'eWalletBalance': instance.eWalletBalance,
      'status': instance.status,
      'ownedbys': instance.ownedbys,
      'roles': instance.roles,
      'allowPermissionSet': instance.allowPermissionSet,
      'denyPermissionSet': instance.denyPermissionSet,
      'allowPermission': instance.allowPermission,
      'denyPermission': instance.denyPermission,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$_SignInResponse _$$_SignInResponseFromJson(Map<String, dynamic> json) =>
    _$_SignInResponse(
      item: json['item'] == null
          ? null
          : ItemResponse.fromJson(json['item'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as int?,
      success: json['success'] as bool?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_SignInResponseToJson(_$_SignInResponse instance) =>
    <String, dynamic>{
      'item': instance.item,
      'statusCode': instance.statusCode,
      'success': instance.success,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'roles': instance.roles,
      'permissions': instance.permissions,
      'message': instance.message,
    };
