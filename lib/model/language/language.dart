// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.freezed.dart';
part 'language.g.dart';

@freezed
class Language with _$Language {
  const factory Language({
    required String name,
    @JsonKey(name: 'stationcount') required int stationCount,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
}
