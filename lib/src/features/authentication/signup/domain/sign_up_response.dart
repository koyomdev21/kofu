import 'dart:convert';

class ItemResponse {
  String? id;
  String? username;
  String? createBy;
  String? createdAt;
  ItemResponse({
    this.id,
    this.username,
    this.createBy,
    this.createdAt,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'createBy': createBy,
      'createdAt': createdAt,
    };
  }

  factory ItemResponse.fromMap(Map<String, dynamic> map) {
    return ItemResponse(
      id: map['id'],
      username: map['username'],
      createBy: map['createBy'],
      createdAt: map['createdAt'],
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory ItemResponse.fromJson(String source) =>
      ItemResponse.fromMap(json.decode(source));
}

class SignUpResponse {
  ItemResponse? item;
  int? statusCode;
  String? message;
  bool? success;
  SignUpResponse({
    this.item,
    this.statusCode,
    this.message,
    this.success,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'item': item?.toMap(),
      'statusCode': statusCode,
      'message': message,
      'success': success,
    };
  }

  factory SignUpResponse.fromMap(Map<String, dynamic> map) {
    return SignUpResponse(
      item: map['item'] != null ? ItemResponse.fromMap(map['item']) : null,
      statusCode: map['statusCode']?.toInt(),
      message: map['message'],
      success: map['success'],
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory SignUpResponse.fromJson(String source) =>
      SignUpResponse.fromMap(json.decode(source));
}
