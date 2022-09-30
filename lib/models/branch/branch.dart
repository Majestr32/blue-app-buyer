import 'package:freezed_annotation/freezed_annotation.dart';

import '../commerce/commerce.dart';

part 'branch.g.dart';
part 'branch.freezed.dart';

@freezed
class Branch with _$Branch{
  const Branch._();
  factory Branch({
    int? id,
    required String username,
    required String phone,
    required String whatsapp,
    required String location,
    required double lat,
    required double ln,
    required Commerce? commerce
  }) = _Branch;

  factory Branch.fromJson(Map<String, Object?> json) => _$BranchFromJson(json);
}