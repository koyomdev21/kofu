import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:kofu/src/features/authentication/signin/domain/sign_in_response.dart';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';

@freezed
class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    required ItemResponse? item,
    required int? statusCode,
    required bool? success,
    required String? message,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
