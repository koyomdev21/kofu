import 'dart:convert';

class BaseResponse {
  bool? success;
  BaseResponse({
    this.success,
  });

  Map<String, dynamic> toMap() {
    return {
      'success': success,
    };
  }

  factory BaseResponse.fromMap(Map<String, dynamic> map) {
    return BaseResponse(
      success: map['success'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BaseResponse.fromJson(String source) =>
      BaseResponse.fromMap(json.decode(source));
}
