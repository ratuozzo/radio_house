// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryImpl _$$CountryImplFromJson(Map<String, dynamic> json) =>
    _$CountryImpl(
      name: json['name'] as String,
      stationCount: (json['stationcount'] as num).toInt(),
    );

Map<String, dynamic> _$$CountryImplToJson(_$CountryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'stationcount': instance.stationCount,
    };
