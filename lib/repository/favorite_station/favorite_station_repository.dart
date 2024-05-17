import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/station/station.dart';
import '../database/database_client.dart';

abstract class FavoriteStationRepository {
  Future<List<Station>> getFavorites();
  Future<void> addFavorite({required Station station});
  Future<void> removeFavorite({required String id});
  Future<bool> isFavorite({required String id});
}

@LazySingleton(as: FavoriteStationRepository)
class FavoriteStationRepositoryImpl implements FavoriteStationRepository {
  final DatabaseClient _databaseClient;

  FavoriteStationRepositoryImpl(this._databaseClient);

  @override
  Future<List<Station>> getFavorites() async {
    final db = await _databaseClient.database;
    final result = await db.query('favorites');

    return result.map(Station.fromJson).toList();
  }

  @override
  Future<void> addFavorite({required Station station}) async {
    final db = await _databaseClient.database;
    await db.insert(
      'favorites',
      station.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> removeFavorite({required String id}) async {
    final db = await _databaseClient.database;
    await db.delete(
      'favorites',
      where: 'stationuuid = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<bool> isFavorite({required String id}) async {
    final db = await _databaseClient.database;
    final result = await db.query(
      'favorites',
      where: 'stationuuid = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }
}
