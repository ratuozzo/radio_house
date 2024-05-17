// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'station.freezed.dart';
part 'station.g.dart';

@freezed
class Station with _$Station {
  const factory Station({
    @JsonKey(name: 'stationuuid') required String id,
    required String name,
    required String url,
    required String favicon,
    required String country,
    required int votes,
    @JsonKey(
      fromJson: tagsFromJson,
      toJson: tagsToJson,
    )
    required List<String> tags,
  }) = _Station;

  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);
}

List<String> tagsFromJson(String tags) {
  final output = <String>[];
  final rawList = tags.split(',').map((tag) => tag).toList();
  for (final item in rawList) {
    if (item.isNotEmpty) {
      output.add(item);
    }
  }
  return output;
}

String tagsToJson(List<String> tags) => tags.join(',');
