// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StationImpl _$$StationImplFromJson(Map<String, dynamic> json) =>
    _$StationImpl(
      id: json['stationuuid'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      favicon: json['favicon'] as String,
      country: json['country'] as String,
      votes: (json['votes'] as num).toInt(),
      tags: tagsFromJson(json['tags'] as String),
    );

Map<String, dynamic> _$$StationImplToJson(_$StationImpl instance) =>
    <String, dynamic>{
      'stationuuid': instance.id,
      'name': instance.name,
      'url': instance.url,
      'favicon': instance.favicon,
      'country': instance.country,
      'votes': instance.votes,
      'tags': tagsToJson(instance.tags),
    };
