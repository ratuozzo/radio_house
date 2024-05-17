import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton()
class DatabaseClient {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('stations.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'TEXT PRIMARY KEY';
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER NOT NULL';

    await db.execute('''
    CREATE TABLE favorites (
      stationuuid $idType,
      name $textType,
      url $textType,
      favicon $textType,
      country $textType,
      votes $intType,
      tags $textType
    )
    ''');
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
