// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'language_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemResponse _$ItemResponseFromJson(Map<String, dynamic> json) {
  return _ItemResponse.fromJson(json);
}

/// @nodoc
mixin _$ItemResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updateAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemResponseCopyWith<ItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemResponseCopyWith<$Res> {
  factory $ItemResponseCopyWith(
          ItemResponse value, $Res Function(ItemResponse) then) =
      _$ItemResponseCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? name,
      String? slug,
      String? code,
      String? createdAt,
      String? updateAt});
}

/// @nodoc
class _$ItemResponseCopyWithImpl<$Res> implements $ItemResponseCopyWith<$Res> {
  _$ItemResponseCopyWithImpl(this._value, this._then);

  final ItemResponse _value;
  // ignore: unused_field
  final $Res Function(ItemResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? code = freezed,
    Object? createdAt = freezed,
    Object? updateAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updateAt: updateAt == freezed
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemResponseCopyWith<$Res>
    implements $ItemResponseCopyWith<$Res> {
  factory _$$_ItemResponseCopyWith(
          _$_ItemResponse value, $Res Function(_$_ItemResponse) then) =
      __$$_ItemResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? name,
      String? slug,
      String? code,
      String? createdAt,
      String? updateAt});
}

/// @nodoc
class __$$_ItemResponseCopyWithImpl<$Res>
    extends _$ItemResponseCopyWithImpl<$Res>
    implements _$$_ItemResponseCopyWith<$Res> {
  __$$_ItemResponseCopyWithImpl(
      _$_ItemResponse _value, $Res Function(_$_ItemResponse) _then)
      : super(_value, (v) => _then(v as _$_ItemResponse));

  @override
  _$_ItemResponse get _value => super._value as _$_ItemResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? code = freezed,
    Object? createdAt = freezed,
    Object? updateAt = freezed,
  }) {
    return _then(_$_ItemResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updateAt: updateAt == freezed
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemResponse implements _ItemResponse {
  const _$_ItemResponse(
      {required this.id,
      required this.name,
      required this.slug,
      required this.code,
      required this.createdAt,
      required this.updateAt});

  factory _$_ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ItemResponseFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? slug;
  @override
  final String? code;
  @override
  final String? createdAt;
  @override
  final String? updateAt;

  @override
  String toString() {
    return 'ItemResponse(id: $id, name: $name, slug: $slug, code: $code, createdAt: $createdAt, updateAt: $updateAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.slug, slug) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updateAt, updateAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(slug),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updateAt));

  @JsonKey(ignore: true)
  @override
  _$$_ItemResponseCopyWith<_$_ItemResponse> get copyWith =>
      __$$_ItemResponseCopyWithImpl<_$_ItemResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemResponseToJson(this);
  }
}

abstract class _ItemResponse implements ItemResponse {
  const factory _ItemResponse(
      {required final String? id,
      required final String? name,
      required final String? slug,
      required final String? code,
      required final String? createdAt,
      required final String? updateAt}) = _$_ItemResponse;

  factory _ItemResponse.fromJson(Map<String, dynamic> json) =
      _$_ItemResponse.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get slug => throw _privateConstructorUsedError;
  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  String? get updateAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ItemResponseCopyWith<_$_ItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemListResponse _$ItemListResponseFromJson(Map<String, dynamic> json) {
  return _ItemListResponse.fromJson(json);
}

/// @nodoc
mixin _$ItemListResponse {
  List<ItemResponse>? get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemListResponseCopyWith<ItemListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemListResponseCopyWith<$Res> {
  factory $ItemListResponseCopyWith(
          ItemListResponse value, $Res Function(ItemListResponse) then) =
      _$ItemListResponseCopyWithImpl<$Res>;
  $Res call({List<ItemResponse>? item});
}

/// @nodoc
class _$ItemListResponseCopyWithImpl<$Res>
    implements $ItemListResponseCopyWith<$Res> {
  _$ItemListResponseCopyWithImpl(this._value, this._then);

  final ItemListResponse _value;
  // ignore: unused_field
  final $Res Function(ItemListResponse) _then;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<ItemResponse>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemListResponseCopyWith<$Res>
    implements $ItemListResponseCopyWith<$Res> {
  factory _$$_ItemListResponseCopyWith(
          _$_ItemListResponse value, $Res Function(_$_ItemListResponse) then) =
      __$$_ItemListResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<ItemResponse>? item});
}

/// @nodoc
class __$$_ItemListResponseCopyWithImpl<$Res>
    extends _$ItemListResponseCopyWithImpl<$Res>
    implements _$$_ItemListResponseCopyWith<$Res> {
  __$$_ItemListResponseCopyWithImpl(
      _$_ItemListResponse _value, $Res Function(_$_ItemListResponse) _then)
      : super(_value, (v) => _then(v as _$_ItemListResponse));

  @override
  _$_ItemListResponse get _value => super._value as _$_ItemListResponse;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_$_ItemListResponse(
      item: item == freezed
          ? _value._item
          : item // ignore: cast_nullable_to_non_nullable
              as List<ItemResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemListResponse implements _ItemListResponse {
  const _$_ItemListResponse({required final List<ItemResponse>? item})
      : _item = item;

  factory _$_ItemListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ItemListResponseFromJson(json);

  final List<ItemResponse>? _item;
  @override
  List<ItemResponse>? get item {
    final value = _item;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ItemListResponse(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemListResponse &&
            const DeepCollectionEquality().equals(other._item, _item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_item));

  @JsonKey(ignore: true)
  @override
  _$$_ItemListResponseCopyWith<_$_ItemListResponse> get copyWith =>
      __$$_ItemListResponseCopyWithImpl<_$_ItemListResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemListResponseToJson(this);
  }
}

abstract class _ItemListResponse implements ItemListResponse {
  const factory _ItemListResponse({required final List<ItemResponse>? item}) =
      _$_ItemListResponse;

  factory _ItemListResponse.fromJson(Map<String, dynamic> json) =
      _$_ItemListResponse.fromJson;

  @override
  List<ItemResponse>? get item => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ItemListResponseCopyWith<_$_ItemListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

LanguageResponse _$LanguageResponseFromJson(Map<String, dynamic> json) {
  return _LanguageResponse.fromJson(json);
}

/// @nodoc
mixin _$LanguageResponse {
  ItemResponse? get items => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguageResponseCopyWith<LanguageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageResponseCopyWith<$Res> {
  factory $LanguageResponseCopyWith(
          LanguageResponse value, $Res Function(LanguageResponse) then) =
      _$LanguageResponseCopyWithImpl<$Res>;
  $Res call({ItemResponse? items, bool? success, int? count});

  $ItemResponseCopyWith<$Res>? get items;
}

/// @nodoc
class _$LanguageResponseCopyWithImpl<$Res>
    implements $LanguageResponseCopyWith<$Res> {
  _$LanguageResponseCopyWithImpl(this._value, this._then);

  final LanguageResponse _value;
  // ignore: unused_field
  final $Res Function(LanguageResponse) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? success = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as ItemResponse?,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $ItemResponseCopyWith<$Res>? get items {
    if (_value.items == null) {
      return null;
    }

    return $ItemResponseCopyWith<$Res>(_value.items!, (value) {
      return _then(_value.copyWith(items: value));
    });
  }
}

/// @nodoc
abstract class _$$_LanguageResponseCopyWith<$Res>
    implements $LanguageResponseCopyWith<$Res> {
  factory _$$_LanguageResponseCopyWith(
          _$_LanguageResponse value, $Res Function(_$_LanguageResponse) then) =
      __$$_LanguageResponseCopyWithImpl<$Res>;
  @override
  $Res call({ItemResponse? items, bool? success, int? count});

  @override
  $ItemResponseCopyWith<$Res>? get items;
}

/// @nodoc
class __$$_LanguageResponseCopyWithImpl<$Res>
    extends _$LanguageResponseCopyWithImpl<$Res>
    implements _$$_LanguageResponseCopyWith<$Res> {
  __$$_LanguageResponseCopyWithImpl(
      _$_LanguageResponse _value, $Res Function(_$_LanguageResponse) _then)
      : super(_value, (v) => _then(v as _$_LanguageResponse));

  @override
  _$_LanguageResponse get _value => super._value as _$_LanguageResponse;

  @override
  $Res call({
    Object? items = freezed,
    Object? success = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_LanguageResponse(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as ItemResponse?,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LanguageResponse implements _LanguageResponse {
  const _$_LanguageResponse(
      {required this.items, required this.success, required this.count});

  factory _$_LanguageResponse.fromJson(Map<String, dynamic> json) =>
      _$$_LanguageResponseFromJson(json);

  @override
  final ItemResponse? items;
  @override
  final bool? success;
  @override
  final int? count;

  @override
  String toString() {
    return 'LanguageResponse(items: $items, success: $success, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LanguageResponse &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$_LanguageResponseCopyWith<_$_LanguageResponse> get copyWith =>
      __$$_LanguageResponseCopyWithImpl<_$_LanguageResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LanguageResponseToJson(this);
  }
}

abstract class _LanguageResponse implements LanguageResponse {
  const factory _LanguageResponse(
      {required final ItemResponse? items,
      required final bool? success,
      required final int? count}) = _$_LanguageResponse;

  factory _LanguageResponse.fromJson(Map<String, dynamic> json) =
      _$_LanguageResponse.fromJson;

  @override
  ItemResponse? get items => throw _privateConstructorUsedError;
  @override
  bool? get success => throw _privateConstructorUsedError;
  @override
  int? get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LanguageResponseCopyWith<_$_LanguageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
