import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/d_injection/inject_dependencies.dart';
import '../../../controller/station/station_controller.dart';
import '../../../model/station/station.dart';
import '../../common/request_provider/request_provider.dart';

final stationsProvider =
    ChangeNotifierProvider((ref) => StationsPresenter(getIt()));

class StationsPresenter extends RequestProvider<List<Station>> {
  StationsPresenter(this._stationController);

  final StationController _stationController;

  void getStations({String? query}) => executeRequest<List<Station>>(
        requestBuilder: () => _stationController.getStations(query: query),
      );

  void getStationsByLanguage({required String language}) => executeRequest(
        requestBuilder: () =>
            _stationController.getStationsByLanguage(language: language),
      );

  void getStationsByCountry({required String country}) => executeRequest(
        requestBuilder: () =>
            _stationController.getStationsByCountry(country: country),
      );
}
