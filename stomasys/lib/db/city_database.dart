import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:stomasys/models/city_model.dart';

import '../models/user_model.dart';

class CitieDatabase {
  static final CitieDatabase instance = CitieDatabase._init();

  static Database? _database;

  CitieDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('cities.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
  await db.execute('''
    CREATE TABLE cities (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT
    )
  ''');
}


  Future<City> insertCity(City city) async {
  final db = await instance.database;
  final id = await db.insert('cities', city.toMap());
  return City(
    id: id,
    name: city.name,
  );
}


  Future<List<City>> getAllCities() async {
  final db = await instance.database;
  final List<Map<String, dynamic>> maps = await db.query('cities');

  return List.generate(maps.length, (index) {
    return City(
      id: maps[index]['id'],
      name: maps[index]['name'],
    );
  });
}

}
