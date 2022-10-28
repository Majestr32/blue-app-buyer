// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Fee _$FeeFromJson(Map<String, dynamic> json) {
  return _Fee.fromJson(json);
}

/// @nodoc
mixin _$Fee {
  @JsonKey(name: 'service_fee')
  double get serviceFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'commission')
  double get commission => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeeCopyWith<Fee> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeeCopyWith<$Res> {
  factory $FeeCopyWith(Fee value, $Res Function(Fee) then) =
      _$FeeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'service_fee') double serviceFee,
      @JsonKey(name: 'commission') double commission});
}

/// @nodoc
class _$FeeCopyWithImpl<$Res> implements $FeeCopyWith<$Res> {
  _$FeeCopyWithImpl(this._value, this._then);

  final Fee _value;
  // ignore: unused_field
  final $Res Function(Fee) _then;

  @override
  $Res call({
    Object? serviceFee = freezed,
    Object? commission = freezed,
  }) {
    return _then(_value.copyWith(
      serviceFee: serviceFee == freezed
          ? _value.serviceFee
          : serviceFee // ignore: cast_nullable_to_non_nullable
              as double,
      commission: commission == freezed
          ? _value.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_FeeCopyWith<$Res> implements $FeeCopyWith<$Res> {
  factory _$$_FeeCopyWith(_$_Fee value, $Res Function(_$_Fee) then) =
      __$$_FeeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'service_fee') double serviceFee,
      @JsonKey(name: 'commission') double commission});
}

/// @nodoc
class __$$_FeeCopyWithImpl<$Res> extends _$FeeCopyWithImpl<$Res>
    implements _$$_FeeCopyWith<$Res> {
  __$$_FeeCopyWithImpl(_$_Fee _value, $Res Function(_$_Fee) _then)
      : super(_value, (v) => _then(v as _$_Fee));

  @override
  _$_Fee get _value => super._value as _$_Fee;

  @override
  $Res call({
    Object? serviceFee = freezed,
    Object? commission = freezed,
  }) {
    return _then(_$_Fee(
      serviceFee: serviceFee == freezed
          ? _value.serviceFee
          : serviceFee // ignore: cast_nullable_to_non_nullable
              as double,
      commission: commission == freezed
          ? _value.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Fee implements _Fee {
  const _$_Fee(
      {@JsonKey(name: 'service_fee') required this.serviceFee,
      @JsonKey(name: 'commission') required this.commission});

  factory _$_Fee.fromJson(Map<String, dynamic> json) => _$$_FeeFromJson(json);

  @override
  @JsonKey(name: 'service_fee')
  final double serviceFee;
  @override
  @JsonKey(name: 'commission')
  final double commission;

  @override
  String toString() {
    return 'Fee(serviceFee: $serviceFee, commission: $commission)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fee &&
            const DeepCollectionEquality()
                .equals(other.serviceFee, serviceFee) &&
            const DeepCollectionEquality()
                .equals(other.commission, commission));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(serviceFee),
      const DeepCollectionEquality().hash(commission));

  @JsonKey(ignore: true)
  @override
  _$$_FeeCopyWith<_$_Fee> get copyWith =>
      __$$_FeeCopyWithImpl<_$_Fee>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeeToJson(
      this,
    );
  }
}

abstract class _Fee implements Fee {
  const factory _Fee(
      {@JsonKey(name: 'service_fee') required final double serviceFee,
      @JsonKey(name: 'commission') required final double commission}) = _$_Fee;

  factory _Fee.fromJson(Map<String, dynamic> json) = _$_Fee.fromJson;

  @override
  @JsonKey(name: 'service_fee')
  double get serviceFee;
  @override
  @JsonKey(name: 'commission')
  double get commission;
  @override
  @JsonKey(ignore: true)
  _$$_FeeCopyWith<_$_Fee> get copyWith => throw _privateConstructorUsedError;
}
