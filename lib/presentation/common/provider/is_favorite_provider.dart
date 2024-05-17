import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/d_injection/inject_dependencies.dart';
import '../../../controller/favorite_station/favorite_station_controller.dart';
import '../request_provider/request_provider.dart';

final isFavoriteProvider =
    ChangeNotifierProvider((ref) => IsFavoritePresenter(getIt()));

class IsFavoritePresenter extends RequestProvider<bool> {
  IsFavoritePresenter(this._favoriteStationController);

  final FavoriteStationController _favoriteStationController;

  void isFavorite({required String id}) => executeRequest(
        requestBuilder: () => _favoriteStationController.isFavorite(id: id),
      );
}
