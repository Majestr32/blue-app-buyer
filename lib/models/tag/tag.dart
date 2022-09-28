import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.g.dart';
part 'tag.freezed.dart';

@freezed
class Tag with _$Tag{
  const Tag._();
  factory Tag({
    required int id,
    required String name,
  }) = _Tag;

  factory Tag.fromJson(Map<String, Object?> json) => _$TagFromJson(json);
}