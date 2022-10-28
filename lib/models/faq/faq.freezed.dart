// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'faq.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Faq _$FaqFromJson(Map<String, dynamic> json) {
  return _Faq.fromJson(json);
}

/// @nodoc
mixin _$Faq {
  @JsonKey(name: 'question')
  String get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer')
  String get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FaqCopyWith<Faq> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqCopyWith<$Res> {
  factory $FaqCopyWith(Faq value, $Res Function(Faq) then) =
      _$FaqCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'question') String question,
      @JsonKey(name: 'answer') String answer});
}

/// @nodoc
class _$FaqCopyWithImpl<$Res> implements $FaqCopyWith<$Res> {
  _$FaqCopyWithImpl(this._value, this._then);

  final Faq _value;
  // ignore: unused_field
  final $Res Function(Faq) _then;

  @override
  $Res call({
    Object? question = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FaqCopyWith<$Res> implements $FaqCopyWith<$Res> {
  factory _$$_FaqCopyWith(_$_Faq value, $Res Function(_$_Faq) then) =
      __$$_FaqCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'question') String question,
      @JsonKey(name: 'answer') String answer});
}

/// @nodoc
class __$$_FaqCopyWithImpl<$Res> extends _$FaqCopyWithImpl<$Res>
    implements _$$_FaqCopyWith<$Res> {
  __$$_FaqCopyWithImpl(_$_Faq _value, $Res Function(_$_Faq) _then)
      : super(_value, (v) => _then(v as _$_Faq));

  @override
  _$_Faq get _value => super._value as _$_Faq;

  @override
  $Res call({
    Object? question = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$_Faq(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Faq extends _Faq {
  const _$_Faq(
      {@JsonKey(name: 'question') required this.question,
      @JsonKey(name: 'answer') required this.answer})
      : super._();

  factory _$_Faq.fromJson(Map<String, dynamic> json) => _$$_FaqFromJson(json);

  @override
  @JsonKey(name: 'question')
  final String question;
  @override
  @JsonKey(name: 'answer')
  final String answer;

  @override
  String toString() {
    return 'Faq(question: $question, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Faq &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other.answer, answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(answer));

  @JsonKey(ignore: true)
  @override
  _$$_FaqCopyWith<_$_Faq> get copyWith =>
      __$$_FaqCopyWithImpl<_$_Faq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FaqToJson(
      this,
    );
  }
}

abstract class _Faq extends Faq {
  const factory _Faq(
      {@JsonKey(name: 'question') required final String question,
      @JsonKey(name: 'answer') required final String answer}) = _$_Faq;
  const _Faq._() : super._();

  factory _Faq.fromJson(Map<String, dynamic> json) = _$_Faq.fromJson;

  @override
  @JsonKey(name: 'question')
  String get question;
  @override
  @JsonKey(name: 'answer')
  String get answer;
  @override
  @JsonKey(ignore: true)
  _$$_FaqCopyWith<_$_Faq> get copyWith => throw _privateConstructorUsedError;
}
