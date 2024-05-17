import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/d_injection/inject_dependencies.dart';
import '../../../controller/favorite_station/favorite_station_controller.dart';
import '../../../model/station/station.dart';
import '../request_provider/request_provider.dart';
import 'add_favorite_provider.dart';
import 'remove_favorite_provider.dart';

final favoriteStationListProvider = ChangeNotifierProvider((ref) {
  final presenter = FavoriteStationListPresenter(getIt());

  ref.listen(addFavoriteProvider, (_, favoritePresenter) {
    presenter.getFavorites();
  });
  ref.listen(removeFavoriteProvider, (_, favoritePresenter) {
    presenter.getFavorites();
  });

  return presenter;
});

class FavoriteStationListPresenter extends RequestProvider<List<Station>> {
  FavoriteStationListPresenter(this._favoriteStationController);

  final FavoriteStationController _favoriteStationController;

  void getFavorites() {
    executeRequest(requestBuilder: _favoriteStationController.getFavorites);
  }
}
