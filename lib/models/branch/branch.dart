import 'package:freezed_annotation/freezed_annotation.dart';

import '../commerce/commerce.dart';

part 'branch.g.dart';
part 'branch.freezed.dart';

@freezed
class Branch with _$Branch{
  const Branch._();
  factory Branch({
    int? id,
    String? name,
    required String username,
    required String phone,
    required String whatsapp,
    required String location,
    required double lat,
    required double ln,
    @JsonKey(name: 'commerce_id') required int commerceId,
    @JsonKey(name: 'logo_url') required String? logoUrl,
    required Commerce? commerce
  }) = _Branch;

  factory Branch.fromJson(Map<String, Object?> json) => _$BranchFromJson(json);
}