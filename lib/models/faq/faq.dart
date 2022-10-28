import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq.g.dart';
part 'faq.freezed.dart';

@freezed
class Faq with _$Faq{
  const Faq._();
  const factory Faq({
    @JsonKey(name: 'question') required String question,
    @JsonKey(name: 'answer') required String answer,
  }) = _Faq;

  factory Faq.fromJson(Map<String, Object?> json) => _$FaqFromJson(json);
}