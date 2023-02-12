import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'language_response.freezed.dart';
part 'language_response.g.dart';

@freezed
class ItemResponse with _$ItemResponse {
  const factory ItemResponse({
    required String? id,
    required String? name,
    required String? slug,
    required String? code,
    required String? createdAt,
    required String? updateAt,
  }) = _ItemResponse;

  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);
}

@freezed
class ItemListResponse with _$ItemListResponse {
  const factory ItemListResponse({
    required List<ItemResponse>? item,
  }) = _ItemListResponse;

  factory ItemListResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemListResponseFromJson(json);
}

@freezed
class LanguageResponse with _$LanguageResponse {
  const factory LanguageResponse({
    required ItemResponse? items,
    required bool? success,
    required int? count,
  }) = _LanguageResponse;

  factory LanguageResponse.fromJson(Map<String, dynamic> json) =>
      _$LanguageResponseFromJson(json);
}
// To parse this JSON data, do
//
//     final languageResponse1 = languageResponse1FromJson(jsonString);

LanguageResponse1 languageResponse1FromJson(String str) =>
    LanguageResponse1.fromJson(json.decode(str));

String languageResponse1ToJson(LanguageResponse1 data) =>
    json.encode(data.toJson());

class LanguageResponse1 {
  LanguageResponse1({
    this.success,
    this.items,
    this.count,
  });

  bool? success;
  List<Item>? items;
  int? count;

  factory LanguageResponse1.fromJson(Map<String, dynamic> json) =>
      LanguageResponse1(
        success: json["success"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "count": count,
      };
}

class Item {
  Item({
    this.id,
    this.name,
    this.slug,
    this.code,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? slug;
  String? code;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        code: json["code"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "code": code,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
