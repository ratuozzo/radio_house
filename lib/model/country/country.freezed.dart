// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
mixin _$Country {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'stationcount')
  int get stationCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call({String name, @JsonKey(name: 'stationcount') int stationCount});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

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
abstract class _$$CountryImplCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$CountryImplCopyWith(
          _$CountryImpl value, $Res Function(_$CountryImpl) then) =
      __$$CountryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, @JsonKey(name: 'stationcount') int stationCount});
}

/// @nodoc
class __$$CountryImplCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$CountryImpl>
    implements _$$CountryImplCopyWith<$Res> {
  __$$CountryImplCopyWithImpl(
      _$CountryImpl _value, $Res Function(_$CountryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? stationCount = null,
  }) {
    return _then(_$CountryImpl(
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
class _$CountryImpl implements _Country {
  const _$CountryImpl(
      {required this.name,
      @JsonKey(name: 'stationcount') required this.stationCount});

  factory _$CountryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'stationcount')
  final int stationCount;

  @override
  String toString() {
    return 'Country(name: $name, stationCount: $stationCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryImpl &&
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
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      __$$CountryImplCopyWithImpl<_$CountryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryImplToJson(
      this,
    );
  }
}

abstract class _Country implements Country {
  const factory _Country(
          {required final String name,
          @JsonKey(name: 'stationcount') required final int stationCount}) =
      _$CountryImpl;

  factory _Country.fromJson(Map<String, dynamic> json) = _$CountryImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'stationcount')
  int get stationCount;
  @override
  @JsonKey(ignore: true)
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
