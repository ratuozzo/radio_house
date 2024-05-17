// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'country.freezed.dart';
part 'country.g.dart';

@freezed
class Country with _$Country {
  const factory Country({
    required String name,
    @JsonKey(name: 'stationcount') required int stationCount,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}
