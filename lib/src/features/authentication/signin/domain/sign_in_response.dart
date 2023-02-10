import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_response.freezed.dart';
part 'sign_in_response.g.dart';

@freezed
class ItemResponse with _$ItemResponse {
  const factory ItemResponse({
    required String? id,
    required String? name,
    required String? username,
    required String? email,
    required int? eWalletBalance,
    required String? status,
    required List<String>? ownedbys,
    required List<String>? roles,
    required List<String>? allowPermissionSet,
    required List<String>? denyPermissionSet,
    required List<String>? allowPermission,
    required List<String>? denyPermission,
    required String? createdBy,
    required DateTime? createdAt,
    required DateTime? updatedAt,
  }) = _ItemResponse;

  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);
}

@freezed
class SignInResponse with _$SignInResponse {
  const factory SignInResponse({
    required ItemResponse? item,
    required int? statusCode,
    required bool? success,
    required String? accessToken,
    required String? refreshToken,
    required List<String>? roles,
    required List<String>? permissions,
    required String? message,
  }) = _SignInResponse;

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);
}

// class SignInResponse {
//   ItemResponse? item;
//   int? statusCode;
//   bool? success;
//   String? accessToken;
//   String? refreshToken;
//   List<String>? roles;
//   List<String>? permissions;
//   String? message;
//   SignInResponse({
//     this.item,
//     this.statusCode,
//     this.success,
//     this.accessToken,
//     this.refreshToken,
//     this.roles,
//     this.permissions,
//     this.message,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'item': item?.toMap(),
//       'statusCode': statusCode,
//       'success': success,
//       'accessToken': accessToken,
//       'refreshToken': refreshToken,
//       'roles': roles,
//       'permissions': permissions,
//       'message': message,
//     };
//   }

//   factory SignInResponse.fromMap(Map<String, dynamic> map) {
//     return SignInResponse(
//       item: map['item'] != null ? ItemResponse.fromMap(map['item']) : null,
//       statusCode: map['statusCode']?.toInt(),
//       success: map['success'],
//       accessToken: map['accessToken'],
//       refreshToken: map['refreshToken'],
//       roles: map['roles'] != null ? List<String>.from(map['roles']) : null,
//       permissions: map['permissions'] != null
//           ? List<String>.from(map['permissions'])
//           : null,
//       message: map['message'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory SignInResponse.fromJson(String source) =>
//       SignInResponse.fromMap(json.decode(source));
// }
