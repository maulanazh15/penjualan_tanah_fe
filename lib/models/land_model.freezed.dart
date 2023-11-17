// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'land_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LandModel _$LandModelFromJson(Map<String, dynamic> json) {
  return _LandModel.fromJson(json);
}

/// @nodoc
mixin _$LandModel {
  int? get id => throw _privateConstructorUsedError;
  String get judul => throw _privateConstructorUsedError;
  int get harga => throw _privateConstructorUsedError;
  double get luas => throw _privateConstructorUsedError;
  String get alamat => throw _privateConstructorUsedError;
  @JsonKey(name: 'foto_tanah')
  String? get fotoTanah => throw _privateConstructorUsedError;
  @JsonKey(name: 'prov_id')
  int? get provId => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_id')
  int? get cityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'dis_id')
  int? get disId => throw _privateConstructorUsedError;
  @JsonKey(name: 'subdis_id')
  int? get subDisId => throw _privateConstructorUsedError;
  String? get keterangan => throw _privateConstructorUsedError;
  double? get tanahLatitude => throw _privateConstructorUsedError;
  double? get tanahLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LandModelCopyWith<LandModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LandModelCopyWith<$Res> {
  factory $LandModelCopyWith(LandModel value, $Res Function(LandModel) then) =
      _$LandModelCopyWithImpl<$Res, LandModel>;
  @useResult
  $Res call(
      {int? id,
      String judul,
      int harga,
      double luas,
      String alamat,
      @JsonKey(name: 'foto_tanah') String? fotoTanah,
      @JsonKey(name: 'prov_id') int? provId,
      @JsonKey(name: 'city_id') int? cityId,
      @JsonKey(name: 'dis_id') int? disId,
      @JsonKey(name: 'subdis_id') int? subDisId,
      String? keterangan,
      double? tanahLatitude,
      double? tanahLongitude,
      @JsonKey(name: 'user_id') int? userId});
}

/// @nodoc
class _$LandModelCopyWithImpl<$Res, $Val extends LandModel>
    implements $LandModelCopyWith<$Res> {
  _$LandModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? judul = null,
    Object? harga = null,
    Object? luas = null,
    Object? alamat = null,
    Object? fotoTanah = freezed,
    Object? provId = freezed,
    Object? cityId = freezed,
    Object? disId = freezed,
    Object? subDisId = freezed,
    Object? keterangan = freezed,
    Object? tanahLatitude = freezed,
    Object? tanahLongitude = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      judul: null == judul
          ? _value.judul
          : judul // ignore: cast_nullable_to_non_nullable
              as String,
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int,
      luas: null == luas
          ? _value.luas
          : luas // ignore: cast_nullable_to_non_nullable
              as double,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      fotoTanah: freezed == fotoTanah
          ? _value.fotoTanah
          : fotoTanah // ignore: cast_nullable_to_non_nullable
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
      keterangan: freezed == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String?,
      tanahLatitude: freezed == tanahLatitude
          ? _value.tanahLatitude
          : tanahLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      tanahLongitude: freezed == tanahLongitude
          ? _value.tanahLongitude
          : tanahLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LandModelImplCopyWith<$Res>
    implements $LandModelCopyWith<$Res> {
  factory _$$LandModelImplCopyWith(
          _$LandModelImpl value, $Res Function(_$LandModelImpl) then) =
      __$$LandModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String judul,
      int harga,
      double luas,
      String alamat,
      @JsonKey(name: 'foto_tanah') String? fotoTanah,
      @JsonKey(name: 'prov_id') int? provId,
      @JsonKey(name: 'city_id') int? cityId,
      @JsonKey(name: 'dis_id') int? disId,
      @JsonKey(name: 'subdis_id') int? subDisId,
      String? keterangan,
      double? tanahLatitude,
      double? tanahLongitude,
      @JsonKey(name: 'user_id') int? userId});
}

/// @nodoc
class __$$LandModelImplCopyWithImpl<$Res>
    extends _$LandModelCopyWithImpl<$Res, _$LandModelImpl>
    implements _$$LandModelImplCopyWith<$Res> {
  __$$LandModelImplCopyWithImpl(
      _$LandModelImpl _value, $Res Function(_$LandModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? judul = null,
    Object? harga = null,
    Object? luas = null,
    Object? alamat = null,
    Object? fotoTanah = freezed,
    Object? provId = freezed,
    Object? cityId = freezed,
    Object? disId = freezed,
    Object? subDisId = freezed,
    Object? keterangan = freezed,
    Object? tanahLatitude = freezed,
    Object? tanahLongitude = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$LandModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      judul: null == judul
          ? _value.judul
          : judul // ignore: cast_nullable_to_non_nullable
              as String,
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int,
      luas: null == luas
          ? _value.luas
          : luas // ignore: cast_nullable_to_non_nullable
              as double,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      fotoTanah: freezed == fotoTanah
          ? _value.fotoTanah
          : fotoTanah // ignore: cast_nullable_to_non_nullable
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
      keterangan: freezed == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String?,
      tanahLatitude: freezed == tanahLatitude
          ? _value.tanahLatitude
          : tanahLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      tanahLongitude: freezed == tanahLongitude
          ? _value.tanahLongitude
          : tanahLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LandModelImpl extends _LandModel {
  _$LandModelImpl(
      {this.id,
      required this.judul,
      required this.harga,
      required this.luas,
      required this.alamat,
      @JsonKey(name: 'foto_tanah') this.fotoTanah,
      @JsonKey(name: 'prov_id') this.provId,
      @JsonKey(name: 'city_id') this.cityId,
      @JsonKey(name: 'dis_id') this.disId,
      @JsonKey(name: 'subdis_id') this.subDisId,
      this.keterangan,
      this.tanahLatitude,
      this.tanahLongitude,
      @JsonKey(name: 'user_id') this.userId})
      : super._();

  factory _$LandModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LandModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String judul;
  @override
  final int harga;
  @override
  final double luas;
  @override
  final String alamat;
  @override
  @JsonKey(name: 'foto_tanah')
  final String? fotoTanah;
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
  final String? keterangan;
  @override
  final double? tanahLatitude;
  @override
  final double? tanahLongitude;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;

  @override
  String toString() {
    return 'LandModel(id: $id, judul: $judul, harga: $harga, luas: $luas, alamat: $alamat, fotoTanah: $fotoTanah, provId: $provId, cityId: $cityId, disId: $disId, subDisId: $subDisId, keterangan: $keterangan, tanahLatitude: $tanahLatitude, tanahLongitude: $tanahLongitude, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LandModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.judul, judul) || other.judul == judul) &&
            (identical(other.harga, harga) || other.harga == harga) &&
            (identical(other.luas, luas) || other.luas == luas) &&
            (identical(other.alamat, alamat) || other.alamat == alamat) &&
            (identical(other.fotoTanah, fotoTanah) ||
                other.fotoTanah == fotoTanah) &&
            (identical(other.provId, provId) || other.provId == provId) &&
            (identical(other.cityId, cityId) || other.cityId == cityId) &&
            (identical(other.disId, disId) || other.disId == disId) &&
            (identical(other.subDisId, subDisId) ||
                other.subDisId == subDisId) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan) &&
            (identical(other.tanahLatitude, tanahLatitude) ||
                other.tanahLatitude == tanahLatitude) &&
            (identical(other.tanahLongitude, tanahLongitude) ||
                other.tanahLongitude == tanahLongitude) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      judul,
      harga,
      luas,
      alamat,
      fotoTanah,
      provId,
      cityId,
      disId,
      subDisId,
      keterangan,
      tanahLatitude,
      tanahLongitude,
      userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LandModelImplCopyWith<_$LandModelImpl> get copyWith =>
      __$$LandModelImplCopyWithImpl<_$LandModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LandModelImplToJson(
      this,
    );
  }
}

abstract class _LandModel extends LandModel {
  factory _LandModel(
      {final int? id,
      required final String judul,
      required final int harga,
      required final double luas,
      required final String alamat,
      @JsonKey(name: 'foto_tanah') final String? fotoTanah,
      @JsonKey(name: 'prov_id') final int? provId,
      @JsonKey(name: 'city_id') final int? cityId,
      @JsonKey(name: 'dis_id') final int? disId,
      @JsonKey(name: 'subdis_id') final int? subDisId,
      final String? keterangan,
      final double? tanahLatitude,
      final double? tanahLongitude,
      @JsonKey(name: 'user_id') final int? userId}) = _$LandModelImpl;
  _LandModel._() : super._();

  factory _LandModel.fromJson(Map<String, dynamic> json) =
      _$LandModelImpl.fromJson;

  @override
  int? get id;
  @override
  String get judul;
  @override
  int get harga;
  @override
  double get luas;
  @override
  String get alamat;
  @override
  @JsonKey(name: 'foto_tanah')
  String? get fotoTanah;
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
  String? get keterangan;
  @override
  double? get tanahLatitude;
  @override
  double? get tanahLongitude;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(ignore: true)
  _$$LandModelImplCopyWith<_$LandModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
