import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/clinic_model.dart';

class ClinicDatabase {
  static final ClinicDatabase instance = ClinicDatabase._init();

  static Database? _database;

  ClinicDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('clinics.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE clinics (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        description TEXT,
        cityId INTEGER,
        FOREIGN KEY (cityId) REFERENCES cities (id)
      )
    ''');
  }

  Future<Clinic> insertClinic(Clinic clinic) async {
    final db = await instance.database;
    final id = await db.insert('clinics', clinic.toMap());
    return Clinic(
      id: id,
      name: clinic.name,
      description: clinic.description,
      cityId: clinic.cityId,
    );
  }

  Future<List<Clinic>> getAllClinics() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('clinics');

    return List.generate(maps.length, (index) {
      return Clinic(
        id: maps[index]['id'],
        name: maps[index]['name'],
        description: maps[index]['description'],
        cityId: maps[index]['cityId'],
      );
    });
  }
  Future<List<Clinic>> getClinicsByCity(int cityId) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'clinics',
      where: 'cityId = ?',
      whereArgs: [cityId],
    );

    return List.generate(maps.length, (index) {
      return Clinic(
        id: maps[index]['id'],
        name: maps[index]['name'],
        description: maps[index]['description'],
        cityId: maps[index]['cityId'],
      );
    });
  }

  // Add more methods for updating, deleting, and other operations as needed
}
