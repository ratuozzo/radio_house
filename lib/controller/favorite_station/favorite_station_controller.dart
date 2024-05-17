import 'package:injectable/injectable.dart';

import '../../model/station/station.dart';
import '../../repository/favorite_station/favorite_station_repository.dart';

abstract class FavoriteStationController {
  Future<List<Station>> getFavorites();
  Future<void> addFavorite({required Station station});
  Future<void> removeFavorite({required String id});
  Future<bool> isFavorite({required String id});
}

@LazySingleton(as: FavoriteStationController)
class FavoriteStationControllerImpl implements FavoriteStationController {
  FavoriteStationControllerImpl(
    this._favoriteRepository,
  );

  final FavoriteStationRepository _favoriteRepository;

  @override
  Future<List<Station>> getFavorites() async {
    return await _favoriteRepository.getFavorites();
  }

  @override
  Future<void> addFavorite({required Station station}) async {
    await _favoriteRepository.addFavorite(station: station);
  }

  @override
  Future<void> removeFavorite({required String id}) async {
    await _favoriteRepository.removeFavorite(id: id);
  }

  @override
  Future<bool> isFavorite({required String id}) async {
    return await _favoriteRepository.isFavorite(id:id);
  }
}
