// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Language _$LanguageFromJson(Map<String, dynamic> json) {
  return _Language.fromJson(json);
}

/// @nodoc
mixin _$Language {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'stationcount')
  int get stationCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguageCopyWith<Language> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageCopyWith<$Res> {
  factory $LanguageCopyWith(Language value, $Res Function(Language) then) =
      _$LanguageCopyWithImpl<$Res, Language>;
  @useResult
  $Res call({String name, @JsonKey(name: 'stationcount') int stationCount});
}

/// @nodoc
class _$LanguageCopyWithImpl<$Res, $Val extends Language>
    implements $LanguageCopyWith<$Res> {
  _$LanguageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? stationCount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stationCount: null == stationCount
          ? _value.stationCount
          : stationCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguageImplCopyWith<$Res>
    implements $LanguageCopyWith<$Res> {
  factory _$$LanguageImplCopyWith(
          _$LanguageImpl value, $Res Function(_$LanguageImpl) then) =
      __$$LanguageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, @JsonKey(name: 'stationcount') int stationCount});
}

/// @nodoc
class __$$LanguageImplCopyWithImpl<$Res>
    extends _$LanguageCopyWithImpl<$Res, _$LanguageImpl>
    implements _$$LanguageImplCopyWith<$Res> {
  __$$LanguageImplCopyWithImpl(
      _$LanguageImpl _value, $Res Function(_$LanguageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? stationCount = null,
  }) {
    return _then(_$LanguageImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stationCount: null == stationCount
          ? _value.stationCount
          : stationCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LanguageImpl implements _Language {
  const _$LanguageImpl(
      {required this.name,
      @JsonKey(name: 'stationcount') required this.stationCount});

  factory _$LanguageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LanguageImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'stationcount')
  final int stationCount;

  @override
  String toString() {
    return 'Language(name: $name, stationCount: $stationCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.stationCount, stationCount) ||
                other.stationCount == stationCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, stationCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageImplCopyWith<_$LanguageImpl> get copyWith =>
      __$$LanguageImplCopyWithImpl<_$LanguageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LanguageImplToJson(
      this,
    );
  }
}

abstract class _Language implements Language {
  const factory _Language(
          {required final String name,
          @JsonKey(name: 'stationcount') required final int stationCount}) =
      _$LanguageImpl;

  factory _Language.fromJson(Map<String, dynamic> json) =
      _$LanguageImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'stationcount')
  int get stationCount;
  @override
  @JsonKey(ignore: true)
  _$$LanguageImplCopyWith<_$LanguageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
