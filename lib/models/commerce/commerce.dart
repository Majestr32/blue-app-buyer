import 'package:freezed_annotation/freezed_annotation.dart';

part 'commerce.g.dart';
part 'commerce.freezed.dart';

@freezed
class Commerce with _$Commerce{
  const Commerce._();
  factory Commerce({
    required int id,
    required String name,
    @JsonKey(name: 'avg_rating') required double avgRating,
    @JsonKey(name: 'coupons_sold') required int couponsSold,
    required String location,
    required String description,
    required double lat,
    required double ln,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'logo_url') required String logoUrl,
    @JsonKey(name: 'reviews_count') required int? reviewsCount
  }) = _Commerce;

  factory Commerce.fromJson(Map<String, Object?> json) => _$CommerceFromJson(json);
}
/*{
            "id": 1,
            "name": "Vendori",
            "avg_rating": 0,
            "coupons_sold": 0,
            "location": "A-4, Km 57, 45300 Ocaña, Toledo, Spain",
            "created_at": "2022-09-14 08:00:11",
            "description": "Mails, connected together into one net are really powerfull, we propose the best in Spain shopping items to buy with high discounts on Fridays",
            "logo_url": "https://lh5.googleusercontent.com/p/AF1QipNScjD32AK8o6ZQ6mqni3fegyP_i5nR-a-7u8EU=w408-h299-k-no"
        }*/