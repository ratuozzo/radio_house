import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/d_injection/inject_dependencies.dart';
import '../../../controller/favorite_station/favorite_station_controller.dart';
import '../request_provider/request_provider.dart';

final removeFavoriteProvider =
    ChangeNotifierProvider((ref) => RemoveFavoritePresenter(getIt()));

class RemoveFavoritePresenter extends RequestProvider<void> {
  RemoveFavoritePresenter(this._favoriteStationController);

  final FavoriteStationController _favoriteStationController;

  void removeFavorite({required String id}) => executeRequest(
        requestBuilder: () => _favoriteStationController.removeFavorite(id: id),
      );
}
