import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/appointment_model.dart';

class AppointmentDatabase {
  static final AppointmentDatabase instance = AppointmentDatabase._init();

  static Database? _database;

  AppointmentDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('appointments.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE appointments (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        time TEXT,
        clinicId INTEGER,
        taken INTEGER
      )
    ''');
  }

  Future<Appointment> insertAppointment(Appointment appointment) async {
    final db = await instance.database;
    final id = await db.insert('appointments', appointment.toMap());
    return Appointment(
      id: id,
      date: appointment.date,
      time: appointment.time,
      clinicId: appointment.clinicId,
      taken: appointment.taken,
    );
  }

  Future<List<Appointment>> getAppointmentsByClinic(int clinicId) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'appointments',
      where: 'clinicId = ?',
      whereArgs: [clinicId],
    );

    return List.generate(maps.length, (index) {
      return Appointment(
        id: maps[index]['id'],
        date: maps[index]['date'],
        time: maps[index]['time'],
        clinicId: maps[index]['clinicId'],
        taken: maps[index]['taken'] == 1,
      );
    });
  }
  Future<void> confirmAppointment(int appointmentId) async {
    final db = await database;
    await db.update(
      'appointments',
      {'taken': 1},
      where: 'id = ?',
      whereArgs: [appointmentId],
    );
  }
}
