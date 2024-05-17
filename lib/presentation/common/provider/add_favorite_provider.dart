import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/d_injection/inject_dependencies.dart';
import '../../../controller/favorite_station/favorite_station_controller.dart';
import '../../../model/station/station.dart';
import '../request_provider/request_provider.dart';

final addFavoriteProvider =
    ChangeNotifierProvider((ref) => AddFavoritePresenter(getIt()));

class AddFavoritePresenter extends RequestProvider<void> {
  AddFavoritePresenter(this._favoriteStationController);

  final FavoriteStationController _favoriteStationController;

  void addFavorite({required Station station}) => executeRequest(
        requestBuilder: () =>
            _favoriteStationController.addFavorite(station: station),
      );
}
