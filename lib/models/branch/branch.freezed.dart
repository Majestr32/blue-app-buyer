// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'branch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return _Branch.fromJson(json);
}

/// @nodoc
mixin _$Branch {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get whatsapp => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get ln => throw _privateConstructorUsedError;
  @JsonKey(name: 'commerce_id')
  int get commerceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String? get logoUrl => throw _privateConstructorUsedError;
  Commerce? get commerce => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchCopyWith<Branch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchCopyWith<$Res> {
  factory $BranchCopyWith(Branch value, $Res Function(Branch) then) =
      _$BranchCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      String username,
      String phone,
      String whatsapp,
      String location,
      double lat,
      double ln,
      @JsonKey(name: 'commerce_id') int commerceId,
      @JsonKey(name: 'logo_url') String? logoUrl,
      Commerce? commerce});

  $CommerceCopyWith<$Res>? get commerce;
}

/// @nodoc
class _$BranchCopyWithImpl<$Res> implements $BranchCopyWith<$Res> {
  _$BranchCopyWithImpl(this._value, this._then);

  final Branch _value;
  // ignore: unused_field
  final $Res Function(Branch) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? phone = freezed,
    Object? whatsapp = freezed,
    Object? location = freezed,
    Object? lat = freezed,
    Object? ln = freezed,
    Object? commerceId = freezed,
    Object? logoUrl = freezed,
    Object? commerce = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      whatsapp: whatsapp == freezed
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      ln: ln == freezed
          ? _value.ln
          : ln // ignore: cast_nullable_to_non_nullable
              as double,
      commerceId: commerceId == freezed
          ? _value.commerceId
          : commerceId // ignore: cast_nullable_to_non_nullable
              as int,
      logoUrl: logoUrl == freezed
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      commerce: commerce == freezed
          ? _value.commerce
          : commerce // ignore: cast_nullable_to_non_nullable
              as Commerce?,
    ));
  }

  @override
  $CommerceCopyWith<$Res>? get commerce {
    if (_value.commerce == null) {
      return null;
    }

    return $CommerceCopyWith<$Res>(_value.commerce!, (value) {
      return _then(_value.copyWith(commerce: value));
    });
  }
}

/// @nodoc
abstract class _$$_BranchCopyWith<$Res> implements $BranchCopyWith<$Res> {
  factory _$$_BranchCopyWith(_$_Branch value, $Res Function(_$_Branch) then) =
      __$$_BranchCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      String username,
      String phone,
      String whatsapp,
      String location,
      double lat,
      double ln,
      @JsonKey(name: 'commerce_id') int commerceId,
      @JsonKey(name: 'logo_url') String? logoUrl,
      Commerce? commerce});

  @override
  $CommerceCopyWith<$Res>? get commerce;
}

/// @nodoc
class __$$_BranchCopyWithImpl<$Res> extends _$BranchCopyWithImpl<$Res>
    implements _$$_BranchCopyWith<$Res> {
  __$$_BranchCopyWithImpl(_$_Branch _value, $Res Function(_$_Branch) _then)
      : super(_value, (v) => _then(v as _$_Branch));

  @override
  _$_Branch get _value => super._value as _$_Branch;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? phone = freezed,
    Object? whatsapp = freezed,
    Object? location = freezed,
    Object? lat = freezed,
    Object? ln = freezed,
    Object? commerceId = freezed,
    Object? logoUrl = freezed,
    Object? commerce = freezed,
  }) {
    return _then(_$_Branch(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      whatsapp: whatsapp == freezed
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      ln: ln == freezed
          ? _value.ln
          : ln // ignore: cast_nullable_to_non_nullable
              as double,
      commerceId: commerceId == freezed
          ? _value.commerceId
          : commerceId // ignore: cast_nullable_to_non_nullable
              as int,
      logoUrl: logoUrl == freezed
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      commerce: commerce == freezed
          ? _value.commerce
          : commerce // ignore: cast_nullable_to_non_nullable
              as Commerce?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Branch extends _Branch {
  _$_Branch(
      {this.id,
      this.name,
      required this.username,
      required this.phone,
      required this.whatsapp,
      required this.location,
      required this.lat,
      required this.ln,
      @JsonKey(name: 'commerce_id') required this.commerceId,
      @JsonKey(name: 'logo_url') required this.logoUrl,
      required this.commerce})
      : super._();

  factory _$_Branch.fromJson(Map<String, dynamic> json) =>
      _$$_BranchFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String username;
  @override
  final String phone;
  @override
  final String whatsapp;
  @override
  final String location;
  @override
  final double lat;
  @override
  final double ln;
  @override
  @JsonKey(name: 'commerce_id')
  final int commerceId;
  @override
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
  @override
  final Commerce? commerce;

  @override
  String toString() {
    return 'Branch(id: $id, name: $name, username: $username, phone: $phone, whatsapp: $whatsapp, location: $location, lat: $lat, ln: $ln, commerceId: $commerceId, logoUrl: $logoUrl, commerce: $commerce)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Branch &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.whatsapp, whatsapp) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.ln, ln) &&
            const DeepCollectionEquality()
                .equals(other.commerceId, commerceId) &&
            const DeepCollectionEquality().equals(other.logoUrl, logoUrl) &&
            const DeepCollectionEquality().equals(other.commerce, commerce));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(whatsapp),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(ln),
      const DeepCollectionEquality().hash(commerceId),
      const DeepCollectionEquality().hash(logoUrl),
      const DeepCollectionEquality().hash(commerce));

  @JsonKey(ignore: true)
  @override
  _$$_BranchCopyWith<_$_Branch> get copyWith =>
      __$$_BranchCopyWithImpl<_$_Branch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BranchToJson(
      this,
    );
  }
}

abstract class _Branch extends Branch {
  factory _Branch(
      {final int? id,
      final String? name,
      required final String username,
      required final String phone,
      required final String whatsapp,
      required final String location,
      required final double lat,
      required final double ln,
      @JsonKey(name: 'commerce_id') required final int commerceId,
      @JsonKey(name: 'logo_url') required final String? logoUrl,
      required final Commerce? commerce}) = _$_Branch;
  _Branch._() : super._();

  factory _Branch.fromJson(Map<String, dynamic> json) = _$_Branch.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String get username;
  @override
  String get phone;
  @override
  String get whatsapp;
  @override
  String get location;
  @override
  double get lat;
  @override
  double get ln;
  @override
  @JsonKey(name: 'commerce_id')
  int get commerceId;
  @override
  @JsonKey(name: 'logo_url')
  String? get logoUrl;
  @override
  Commerce? get commerce;
  @override
  @JsonKey(ignore: true)
  _$$_BranchCopyWith<_$_Branch> get copyWith =>
      throw _privateConstructorUsedError;
}
