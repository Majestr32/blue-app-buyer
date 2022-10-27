import 'package:freezed_annotation/freezed_annotation.dart';

part 'fee.freezed.dart';
part 'fee.g.dart';

@freezed
class Fee with _$Fee {
  const factory Fee({
    @JsonKey(name: 'service_fee') required double serviceFee,
    @JsonKey(name: 'commission') required double commission
  }) = _Fee;

  factory Fee.fromJson(Map<String, Object?> json)
  => _$FeeFromJson(json);
}