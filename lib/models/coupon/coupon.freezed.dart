// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coupon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Coupon _$CouponFromJson(Map<String, dynamic> json) {
  return _Coupon.fromJson(json);
}

/// @nodoc
mixin _$Coupon {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'commerce_id')
  int get commerceId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_url')
  String get encodedPosterUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  double get priceDouble => throw _privateConstructorUsedError;
  @JsonKey(name: 'exp_date')
  DateTime get expDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'campaign_ending')
  DateTime get campaignEnding => throw _privateConstructorUsedError;
  int? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'commerce')
  Commerce get commerce => throw _privateConstructorUsedError;
  int get sold => throw _privateConstructorUsedError;
  @JsonKey(name: 'avg_rating')
  double get avgRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'reviews_count')
  int get reviewsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'terms_and_conditions')
  String get termsAndConditions => throw _privateConstructorUsedError;
  @JsonKey(name: 'faqs')
  List<Faq>? get faqs => throw _privateConstructorUsedError;
  List<String>? get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponCopyWith<Coupon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponCopyWith<$Res> {
  factory $CouponCopyWith(Coupon value, $Res Function(Coupon) then) =
      _$CouponCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'commerce_id') int commerceId,
      String name,
      String description,
      @JsonKey(name: 'poster_url') String encodedPosterUrl,
      @JsonKey(name: 'price') double priceDouble,
      @JsonKey(name: 'exp_date') DateTime expDate,
      @JsonKey(name: 'campaign_ending') DateTime campaignEnding,
      int? discount,
      @JsonKey(name: 'commerce') Commerce commerce,
      int sold,
      @JsonKey(name: 'avg_rating') double avgRating,
      @JsonKey(name: 'reviews_count') int reviewsCount,
      @JsonKey(name: 'terms_and_conditions') String termsAndConditions,
      @JsonKey(name: 'faqs') List<Faq>? faqs,
      List<String>? items});

  $CommerceCopyWith<$Res> get commerce;
}

/// @nodoc
class _$CouponCopyWithImpl<$Res> implements $CouponCopyWith<$Res> {
  _$CouponCopyWithImpl(this._value, this._then);

  final Coupon _value;
  // ignore: unused_field
  final $Res Function(Coupon) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? commerceId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? encodedPosterUrl = freezed,
    Object? priceDouble = freezed,
    Object? expDate = freezed,
    Object? campaignEnding = freezed,
    Object? discount = freezed,
    Object? commerce = freezed,
    Object? sold = freezed,
    Object? avgRating = freezed,
    Object? reviewsCount = freezed,
    Object? termsAndConditions = freezed,
    Object? faqs = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      commerceId: commerceId == freezed
          ? _value.commerceId
          : commerceId // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      encodedPosterUrl: encodedPosterUrl == freezed
          ? _value.encodedPosterUrl
          : encodedPosterUrl // ignore: cast_nullable_to_non_nullable
              as String,
      priceDouble: priceDouble == freezed
          ? _value.priceDouble
          : priceDouble // ignore: cast_nullable_to_non_nullable
              as double,
      expDate: expDate == freezed
          ? _value.expDate
          : expDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      campaignEnding: campaignEnding == freezed
          ? _value.campaignEnding
          : campaignEnding // ignore: cast_nullable_to_non_nullable
              as DateTime,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      commerce: commerce == freezed
          ? _value.commerce
          : commerce // ignore: cast_nullable_to_non_nullable
              as Commerce,
      sold: sold == freezed
          ? _value.sold
          : sold // ignore: cast_nullable_to_non_nullable
              as int,
      avgRating: avgRating == freezed
          ? _value.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewsCount: reviewsCount == freezed
          ? _value.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      termsAndConditions: termsAndConditions == freezed
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as String,
      faqs: faqs == freezed
          ? _value.faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as List<Faq>?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }

  @override
  $CommerceCopyWith<$Res> get commerce {
    return $CommerceCopyWith<$Res>(_value.commerce, (value) {
      return _then(_value.copyWith(commerce: value));
    });
  }
}

/// @nodoc
abstract class _$$_CouponCopyWith<$Res> implements $CouponCopyWith<$Res> {
  factory _$$_CouponCopyWith(_$_Coupon value, $Res Function(_$_Coupon) then) =
      __$$_CouponCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'commerce_id') int commerceId,
      String name,
      String description,
      @JsonKey(name: 'poster_url') String encodedPosterUrl,
      @JsonKey(name: 'price') double priceDouble,
      @JsonKey(name: 'exp_date') DateTime expDate,
      @JsonKey(name: 'campaign_ending') DateTime campaignEnding,
      int? discount,
      @JsonKey(name: 'commerce') Commerce commerce,
      int sold,
      @JsonKey(name: 'avg_rating') double avgRating,
      @JsonKey(name: 'reviews_count') int reviewsCount,
      @JsonKey(name: 'terms_and_conditions') String termsAndConditions,
      @JsonKey(name: 'faqs') List<Faq>? faqs,
      List<String>? items});

  @override
  $CommerceCopyWith<$Res> get commerce;
}

/// @nodoc
class __$$_CouponCopyWithImpl<$Res> extends _$CouponCopyWithImpl<$Res>
    implements _$$_CouponCopyWith<$Res> {
  __$$_CouponCopyWithImpl(_$_Coupon _value, $Res Function(_$_Coupon) _then)
      : super(_value, (v) => _then(v as _$_Coupon));

  @override
  _$_Coupon get _value => super._value as _$_Coupon;

  @override
  $Res call({
    Object? id = freezed,
    Object? commerceId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? encodedPosterUrl = freezed,
    Object? priceDouble = freezed,
    Object? expDate = freezed,
    Object? campaignEnding = freezed,
    Object? discount = freezed,
    Object? commerce = freezed,
    Object? sold = freezed,
    Object? avgRating = freezed,
    Object? reviewsCount = freezed,
    Object? termsAndConditions = freezed,
    Object? faqs = freezed,
    Object? items = freezed,
  }) {
    return _then(_$_Coupon(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      commerceId: commerceId == freezed
          ? _value.commerceId
          : commerceId // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      encodedPosterUrl: encodedPosterUrl == freezed
          ? _value.encodedPosterUrl
          : encodedPosterUrl // ignore: cast_nullable_to_non_nullable
              as String,
      priceDouble: priceDouble == freezed
          ? _value.priceDouble
          : priceDouble // ignore: cast_nullable_to_non_nullable
              as double,
      expDate: expDate == freezed
          ? _value.expDate
          : expDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      campaignEnding: campaignEnding == freezed
          ? _value.campaignEnding
          : campaignEnding // ignore: cast_nullable_to_non_nullable
              as DateTime,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      commerce: commerce == freezed
          ? _value.commerce
          : commerce // ignore: cast_nullable_to_non_nullable
              as Commerce,
      sold: sold == freezed
          ? _value.sold
          : sold // ignore: cast_nullable_to_non_nullable
              as int,
      avgRating: avgRating == freezed
          ? _value.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewsCount: reviewsCount == freezed
          ? _value.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      termsAndConditions: termsAndConditions == freezed
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as String,
      faqs: faqs == freezed
          ? _value._faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as List<Faq>?,
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Coupon extends _Coupon {
  _$_Coupon(
      {required this.id,
      @JsonKey(name: 'commerce_id') required this.commerceId,
      required this.name,
      required this.description,
      @JsonKey(name: 'poster_url') required this.encodedPosterUrl,
      @JsonKey(name: 'price') required this.priceDouble,
      @JsonKey(name: 'exp_date') required this.expDate,
      @JsonKey(name: 'campaign_ending') required this.campaignEnding,
      required this.discount,
      @JsonKey(name: 'commerce') required this.commerce,
      required this.sold,
      @JsonKey(name: 'avg_rating') required this.avgRating,
      @JsonKey(name: 'reviews_count') required this.reviewsCount,
      @JsonKey(name: 'terms_and_conditions') required this.termsAndConditions,
      @JsonKey(name: 'faqs') required final List<Faq>? faqs,
      required final List<String>? items})
      : _faqs = faqs,
        _items = items,
        super._();

  factory _$_Coupon.fromJson(Map<String, dynamic> json) =>
      _$$_CouponFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'commerce_id')
  final int commerceId;
  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey(name: 'poster_url')
  final String encodedPosterUrl;
  @override
  @JsonKey(name: 'price')
  final double priceDouble;
  @override
  @JsonKey(name: 'exp_date')
  final DateTime expDate;
  @override
  @JsonKey(name: 'campaign_ending')
  final DateTime campaignEnding;
  @override
  final int? discount;
  @override
  @JsonKey(name: 'commerce')
  final Commerce commerce;
  @override
  final int sold;
  @override
  @JsonKey(name: 'avg_rating')
  final double avgRating;
  @override
  @JsonKey(name: 'reviews_count')
  final int reviewsCount;
  @override
  @JsonKey(name: 'terms_and_conditions')
  final String termsAndConditions;
  final List<Faq>? _faqs;
  @override
  @JsonKey(name: 'faqs')
  List<Faq>? get faqs {
    final value = _faqs;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _items;
  @override
  List<String>? get items {
    final value = _items;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Coupon(id: $id, commerceId: $commerceId, name: $name, description: $description, encodedPosterUrl: $encodedPosterUrl, priceDouble: $priceDouble, expDate: $expDate, campaignEnding: $campaignEnding, discount: $discount, commerce: $commerce, sold: $sold, avgRating: $avgRating, reviewsCount: $reviewsCount, termsAndConditions: $termsAndConditions, faqs: $faqs, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Coupon &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.commerceId, commerceId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.encodedPosterUrl, encodedPosterUrl) &&
            const DeepCollectionEquality()
                .equals(other.priceDouble, priceDouble) &&
            const DeepCollectionEquality().equals(other.expDate, expDate) &&
            const DeepCollectionEquality()
                .equals(other.campaignEnding, campaignEnding) &&
            const DeepCollectionEquality().equals(other.discount, discount) &&
            const DeepCollectionEquality().equals(other.commerce, commerce) &&
            const DeepCollectionEquality().equals(other.sold, sold) &&
            const DeepCollectionEquality().equals(other.avgRating, avgRating) &&
            const DeepCollectionEquality()
                .equals(other.reviewsCount, reviewsCount) &&
            const DeepCollectionEquality()
                .equals(other.termsAndConditions, termsAndConditions) &&
            const DeepCollectionEquality().equals(other._faqs, _faqs) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(commerceId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(encodedPosterUrl),
      const DeepCollectionEquality().hash(priceDouble),
      const DeepCollectionEquality().hash(expDate),
      const DeepCollectionEquality().hash(campaignEnding),
      const DeepCollectionEquality().hash(discount),
      const DeepCollectionEquality().hash(commerce),
      const DeepCollectionEquality().hash(sold),
      const DeepCollectionEquality().hash(avgRating),
      const DeepCollectionEquality().hash(reviewsCount),
      const DeepCollectionEquality().hash(termsAndConditions),
      const DeepCollectionEquality().hash(_faqs),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  _$$_CouponCopyWith<_$_Coupon> get copyWith =>
      __$$_CouponCopyWithImpl<_$_Coupon>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CouponToJson(
      this,
    );
  }
}

abstract class _Coupon extends Coupon {
  factory _Coupon(
      {required final int id,
      @JsonKey(name: 'commerce_id')
          required final int commerceId,
      required final String name,
      required final String description,
      @JsonKey(name: 'poster_url')
          required final String encodedPosterUrl,
      @JsonKey(name: 'price')
          required final double priceDouble,
      @JsonKey(name: 'exp_date')
          required final DateTime expDate,
      @JsonKey(name: 'campaign_ending')
          required final DateTime campaignEnding,
      required final int? discount,
      @JsonKey(name: 'commerce')
          required final Commerce commerce,
      required final int sold,
      @JsonKey(name: 'avg_rating')
          required final double avgRating,
      @JsonKey(name: 'reviews_count')
          required final int reviewsCount,
      @JsonKey(name: 'terms_and_conditions')
          required final String termsAndConditions,
      @JsonKey(name: 'faqs')
          required final List<Faq>? faqs,
      required final List<String>? items}) = _$_Coupon;
  _Coupon._() : super._();

  factory _Coupon.fromJson(Map<String, dynamic> json) = _$_Coupon.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'commerce_id')
  int get commerceId;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(name: 'poster_url')
  String get encodedPosterUrl;
  @override
  @JsonKey(name: 'price')
  double get priceDouble;
  @override
  @JsonKey(name: 'exp_date')
  DateTime get expDate;
  @override
  @JsonKey(name: 'campaign_ending')
  DateTime get campaignEnding;
  @override
  int? get discount;
  @override
  @JsonKey(name: 'commerce')
  Commerce get commerce;
  @override
  int get sold;
  @override
  @JsonKey(name: 'avg_rating')
  double get avgRating;
  @override
  @JsonKey(name: 'reviews_count')
  int get reviewsCount;
  @override
  @JsonKey(name: 'terms_and_conditions')
  String get termsAndConditions;
  @override
  @JsonKey(name: 'faqs')
  List<Faq>? get faqs;
  @override
  List<String>? get items;
  @override
  @JsonKey(ignore: true)
  _$$_CouponCopyWith<_$_Coupon> get copyWith =>
      throw _privateConstructorUsedError;
}
