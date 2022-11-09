import 'package:blue/models/faq/faq.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../commerce/commerce.dart';

part 'coupon.g.dart';
part 'coupon.freezed.dart';

@freezed
class Coupon with _$Coupon{
  const Coupon._();

  double get priceWithDiscount => double.parse((price * (1 - discount! / 100)).toStringAsFixed(2));
  factory Coupon({
    required int id,
    @JsonKey(name: 'commerce_id') required int commerceId,
    required String name,
    required String description,
    @JsonKey(name: 'poster_url') required String posterUrl,
    required double price,
    @JsonKey(name: 'exp_date') required DateTime expDate,
    @JsonKey(name: 'campaign_ending') required DateTime campaignEnding,
    required int? discount,
    @JsonKey(name: 'commerce') required Commerce commerce,
    required int sold,
    @JsonKey(name: 'avg_rating') required double avgRating,
    @JsonKey(name: 'reviews_count') required int reviewsCount,
    @JsonKey(name: 'faqs') required List<Faq>? faqs,
    required List<String>? items
  }) = _Coupon;

  factory Coupon.fromJson(Map<String, Object?> json) => _$CouponFromJson(json);
}

/*{
        "id": 1,
        "commerce_id": 1,
        "name": "Fridges 40%",
        "description": "Get 40% discount for ANY fridge at our shop!",
        "price": 10.00,
        "exp_date": "2022-10-05 13:00:00",
        "discount": 10
    }*/