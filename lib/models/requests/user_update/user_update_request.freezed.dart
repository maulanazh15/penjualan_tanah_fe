// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_update_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserUpdateRequest _$UserUpdateRequestFromJson(Map<String, dynamic> json) {
  return _UserUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$UserUpdateRequest {
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'prov_id')
  int? get provId => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_id')
  int? get cityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'dis_id')
  int? get disId => throw _privateConstructorUsedError;
  @JsonKey(name: 'subdis_id')
  int? get subDisId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserUpdateRequestCopyWith<UserUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserUpdateRequestCopyWith<$Res> {
  factory $UserUpdateRequestCopyWith(
          UserUpdateRequest value, $Res Function(UserUpdateRequest) then) =
      _$UserUpdateRequestCopyWithImpl<$Res, UserUpdateRequest>;
  @useResult
  $Res call(
      {String? username,
      String? email,
      @JsonKey(name: 'prov_id') int? provId,
      @JsonKey(name: 'city_id') int? cityId,
      @JsonKey(name: 'dis_id') int? disId,
      @JsonKey(name: 'subdis_id') int? subDisId});
}

/// @nodoc
class _$UserUpdateRequestCopyWithImpl<$Res, $Val extends UserUpdateRequest>
    implements $UserUpdateRequestCopyWith<$Res> {
  _$UserUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? email = freezed,
    Object? provId = freezed,
    Object? cityId = freezed,
    Object? disId = freezed,
    Object? subDisId = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      provId: freezed == provId
          ? _value.provId
          : provId // ignore: cast_nullable_to_non_nullable
              as int?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
      disId: freezed == disId
          ? _value.disId
          : disId // ignore: cast_nullable_to_non_nullable
              as int?,
      subDisId: freezed == subDisId
          ? _value.subDisId
          : subDisId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserUpdateRequestImplCopyWith<$Res>
    implements $UserUpdateRequestCopyWith<$Res> {
  factory _$$UserUpdateRequestImplCopyWith(_$UserUpdateRequestImpl value,
          $Res Function(_$UserUpdateRequestImpl) then) =
      __$$UserUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? username,
      String? email,
      @JsonKey(name: 'prov_id') int? provId,
      @JsonKey(name: 'city_id') int? cityId,
      @JsonKey(name: 'dis_id') int? disId,
      @JsonKey(name: 'subdis_id') int? subDisId});
}

/// @nodoc
class __$$UserUpdateRequestImplCopyWithImpl<$Res>
    extends _$UserUpdateRequestCopyWithImpl<$Res, _$UserUpdateRequestImpl>
    implements _$$UserUpdateRequestImplCopyWith<$Res> {
  __$$UserUpdateRequestImplCopyWithImpl(_$UserUpdateRequestImpl _value,
      $Res Function(_$UserUpdateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? email = freezed,
    Object? provId = freezed,
    Object? cityId = freezed,
    Object? disId = freezed,
    Object? subDisId = freezed,
  }) {
    return _then(_$UserUpdateRequestImpl(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      provId: freezed == provId
          ? _value.provId
          : provId // ignore: cast_nullable_to_non_nullable
              as int?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
      disId: freezed == disId
          ? _value.disId
          : disId // ignore: cast_nullable_to_non_nullable
              as int?,
      subDisId: freezed == subDisId
          ? _value.subDisId
          : subDisId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserUpdateRequestImpl implements _UserUpdateRequest {
  _$UserUpdateRequestImpl(
      {this.username,
      this.email,
      @JsonKey(name: 'prov_id') this.provId,
      @JsonKey(name: 'city_id') this.cityId,
      @JsonKey(name: 'dis_id') this.disId,
      @JsonKey(name: 'subdis_id') this.subDisId});

  factory _$UserUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserUpdateRequestImplFromJson(json);

  @override
  final String? username;
  @override
  final String? email;
  @override
  @JsonKey(name: 'prov_id')
  final int? provId;
  @override
  @JsonKey(name: 'city_id')
  final int? cityId;
  @override
  @JsonKey(name: 'dis_id')
  final int? disId;
  @override
  @JsonKey(name: 'subdis_id')
  final int? subDisId;

  @override
  String toString() {
    return 'UserUpdateRequest(username: $username, email: $email, provId: $provId, cityId: $cityId, disId: $disId, subDisId: $subDisId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUpdateRequestImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.provId, provId) || other.provId == provId) &&
            (identical(other.cityId, cityId) || other.cityId == cityId) &&
            (identical(other.disId, disId) || other.disId == disId) &&
            (identical(other.subDisId, subDisId) ||
                other.subDisId == subDisId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, username, email, provId, cityId, disId, subDisId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUpdateRequestImplCopyWith<_$UserUpdateRequestImpl> get copyWith =>
      __$$UserUpdateRequestImplCopyWithImpl<_$UserUpdateRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserUpdateRequestImplToJson(
      this,
    );
  }
}

abstract class _UserUpdateRequest implements UserUpdateRequest {
  factory _UserUpdateRequest(
          {final String? username,
          final String? email,
          @JsonKey(name: 'prov_id') final int? provId,
          @JsonKey(name: 'city_id') final int? cityId,
          @JsonKey(name: 'dis_id') final int? disId,
          @JsonKey(name: 'subdis_id') final int? subDisId}) =
      _$UserUpdateRequestImpl;

  factory _UserUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$UserUpdateRequestImpl.fromJson;

  @override
  String? get username;
  @override
  String? get email;
  @override
  @JsonKey(name: 'prov_id')
  int? get provId;
  @override
  @JsonKey(name: 'city_id')
  int? get cityId;
  @override
  @JsonKey(name: 'dis_id')
  int? get disId;
  @override
  @JsonKey(name: 'subdis_id')
  int? get subDisId;
  @override
  @JsonKey(ignore: true)
  _$$UserUpdateRequestImplCopyWith<_$UserUpdateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
