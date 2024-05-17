import 'package:injectable/injectable.dart';

import '../../model/station/station.dart';
import '../../repository/station/station_repository.dart';
import '../../util/extension/string_extension.dart';

abstract class StationController {
  Future<List<Station>> getStations({String? query});
  Future<List<Station>> getStationsByLanguage({required String language});
  Future<List<Station>> getStationsByCountry({required String country});
}

@LazySingleton(as: StationController)
class StationControllerImpl implements StationController {
  StationControllerImpl(
    this._stationRepository,
  );

  final StationRepository _stationRepository;

  @override
  Future<List<Station>> getStations({String? query}) async {
    final output = <Station>[];
    List<Station> stations;
    if (query != null) {
      stations = await _stationRepository.searchStations(query: query);
    } else {
      stations = await _stationRepository.getStations();
    }
    for (final station in stations) {
      if (!station.name.containsCharactersOrNumbers()) {
        output.add(station.copyWith(name: 'No name station'));
      } else {
        output.add(station.copyWith(name: station.name.trim()));
      }
    }
    return output;
  }

  @override
  Future<List<Station>> getStationsByLanguage({
    required String language,
  }) async {
    return _stationRepository.getStationsByLanguage(language: language);
  }

  @override
  Future<List<Station>> getStationsByCountry({
    required String country,
  }) async {
    return _stationRepository.getStationsByCountry(country: country);
  }
}
