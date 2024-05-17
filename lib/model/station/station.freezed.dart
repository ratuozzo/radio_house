// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Station _$StationFromJson(Map<String, dynamic> json) {
  return _Station.fromJson(json);
}

/// @nodoc
mixin _$Station {
  @JsonKey(name: 'stationuuid')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get favicon => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  int get votes => throw _privateConstructorUsedError;
  @JsonKey(fromJson: tagsFromJson, toJson: tagsToJson)
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StationCopyWith<Station> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationCopyWith<$Res> {
  factory $StationCopyWith(Station value, $Res Function(Station) then) =
      _$StationCopyWithImpl<$Res, Station>;
  @useResult
  $Res call(
      {@JsonKey(name: 'stationuuid') String id,
      String name,
      String url,
      String favicon,
      String country,
      int votes,
      @JsonKey(fromJson: tagsFromJson, toJson: tagsToJson) List<String> tags});
}

/// @nodoc
class _$StationCopyWithImpl<$Res, $Val extends Station>
    implements $StationCopyWith<$Res> {
  _$StationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
    Object? favicon = null,
    Object? country = null,
    Object? votes = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      favicon: null == favicon
          ? _value.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      votes: null == votes
          ? _value.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationImplCopyWith<$Res> implements $StationCopyWith<$Res> {
  factory _$$StationImplCopyWith(
          _$StationImpl value, $Res Function(_$StationImpl) then) =
      __$$StationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'stationuuid') String id,
      String name,
      String url,
      String favicon,
      String country,
      int votes,
      @JsonKey(fromJson: tagsFromJson, toJson: tagsToJson) List<String> tags});
}

/// @nodoc
class __$$StationImplCopyWithImpl<$Res>
    extends _$StationCopyWithImpl<$Res, _$StationImpl>
    implements _$$StationImplCopyWith<$Res> {
  __$$StationImplCopyWithImpl(
      _$StationImpl _value, $Res Function(_$StationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
    Object? favicon = null,
    Object? country = null,
    Object? votes = null,
    Object? tags = null,
  }) {
    return _then(_$StationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      favicon: null == favicon
          ? _value.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      votes: null == votes
          ? _value.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StationImpl implements _Station {
  const _$StationImpl(
      {@JsonKey(name: 'stationuuid') required this.id,
      required this.name,
      required this.url,
      required this.favicon,
      required this.country,
      required this.votes,
      @JsonKey(fromJson: tagsFromJson, toJson: tagsToJson)
      required final List<String> tags})
      : _tags = tags;

  factory _$StationImpl.fromJson(Map<String, dynamic> json) =>
      _$$StationImplFromJson(json);

  @override
  @JsonKey(name: 'stationuuid')
  final String id;
  @override
  final String name;
  @override
  final String url;
  @override
  final String favicon;
  @override
  final String country;
  @override
  final int votes;
  final List<String> _tags;
  @override
  @JsonKey(fromJson: tagsFromJson, toJson: tagsToJson)
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'Station(id: $id, name: $name, url: $url, favicon: $favicon, country: $country, votes: $votes, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.favicon, favicon) || other.favicon == favicon) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.votes, votes) || other.votes == votes) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, url, favicon, country,
      votes, const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StationImplCopyWith<_$StationImpl> get copyWith =>
      __$$StationImplCopyWithImpl<_$StationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StationImplToJson(
      this,
    );
  }
}

abstract class _Station implements Station {
  const factory _Station(
      {@JsonKey(name: 'stationuuid') required final String id,
      required final String name,
      required final String url,
      required final String favicon,
      required final String country,
      required final int votes,
      @JsonKey(fromJson: tagsFromJson, toJson: tagsToJson)
      required final List<String> tags}) = _$StationImpl;

  factory _Station.fromJson(Map<String, dynamic> json) = _$StationImpl.fromJson;

  @override
  @JsonKey(name: 'stationuuid')
  String get id;
  @override
  String get name;
  @override
  String get url;
  @override
  String get favicon;
  @override
  String get country;
  @override
  int get votes;
  @override
  @JsonKey(fromJson: tagsFromJson, toJson: tagsToJson)
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$StationImplCopyWith<_$StationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
