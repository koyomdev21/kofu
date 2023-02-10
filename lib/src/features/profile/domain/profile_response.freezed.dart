// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) {
  return _ProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$ProfileResponse {
  ItemResponse? get item => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileResponseCopyWith<ProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileResponseCopyWith<$Res> {
  factory $ProfileResponseCopyWith(
          ProfileResponse value, $Res Function(ProfileResponse) then) =
      _$ProfileResponseCopyWithImpl<$Res>;
  $Res call(
      {ItemResponse? item, int? statusCode, bool? success, String? message});

  $ItemResponseCopyWith<$Res>? get item;
}

/// @nodoc
class _$ProfileResponseCopyWithImpl<$Res>
    implements $ProfileResponseCopyWith<$Res> {
  _$ProfileResponseCopyWithImpl(this._value, this._then);

  final ProfileResponse _value;
  // ignore: unused_field
  final $Res Function(ProfileResponse) _then;

  @override
  $Res call({
    Object? item = freezed,
    Object? statusCode = freezed,
    Object? success = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemResponse?,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ItemResponseCopyWith<$Res>? get item {
    if (_value.item == null) {
      return null;
    }

    return $ItemResponseCopyWith<$Res>(_value.item!, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc
abstract class _$$_ProfileResponseCopyWith<$Res>
    implements $ProfileResponseCopyWith<$Res> {
  factory _$$_ProfileResponseCopyWith(
          _$_ProfileResponse value, $Res Function(_$_ProfileResponse) then) =
      __$$_ProfileResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {ItemResponse? item, int? statusCode, bool? success, String? message});

  @override
  $ItemResponseCopyWith<$Res>? get item;
}

/// @nodoc
class __$$_ProfileResponseCopyWithImpl<$Res>
    extends _$ProfileResponseCopyWithImpl<$Res>
    implements _$$_ProfileResponseCopyWith<$Res> {
  __$$_ProfileResponseCopyWithImpl(
      _$_ProfileResponse _value, $Res Function(_$_ProfileResponse) _then)
      : super(_value, (v) => _then(v as _$_ProfileResponse));

  @override
  _$_ProfileResponse get _value => super._value as _$_ProfileResponse;

  @override
  $Res call({
    Object? item = freezed,
    Object? statusCode = freezed,
    Object? success = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_ProfileResponse(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemResponse?,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileResponse implements _ProfileResponse {
  const _$_ProfileResponse(
      {required this.item,
      required this.statusCode,
      required this.success,
      required this.message});

  factory _$_ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileResponseFromJson(json);

  @override
  final ItemResponse? item;
  @override
  final int? statusCode;
  @override
  final bool? success;
  @override
  final String? message;

  @override
  String toString() {
    return 'ProfileResponse(item: $item, statusCode: $statusCode, success: $success, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileResponse &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode) &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(statusCode),
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_ProfileResponseCopyWith<_$_ProfileResponse> get copyWith =>
      __$$_ProfileResponseCopyWithImpl<_$_ProfileResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileResponseToJson(this);
  }
}

abstract class _ProfileResponse implements ProfileResponse {
  const factory _ProfileResponse(
      {required final ItemResponse? item,
      required final int? statusCode,
      required final bool? success,
      required final String? message}) = _$_ProfileResponse;

  factory _ProfileResponse.fromJson(Map<String, dynamic> json) =
      _$_ProfileResponse.fromJson;

  @override
  ItemResponse? get item => throw _privateConstructorUsedError;
  @override
  int? get statusCode => throw _privateConstructorUsedError;
  @override
  bool? get success => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileResponseCopyWith<_$_ProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
