import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

import '../SimpleSecond/alarm_sdt.dart';

class SqliteStore {
  SqliteStore();
  dynamic database;

  void open() {
    _open();
  }

  void _open() async {
    // Avoid errors caused by flutter upgrade.
    WidgetsFlutterBinding.ensureInitialized();
    database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      await getDatabasesPath() + 'simple_alarms_database.db',
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE alarms(id INTEGER PRIMARY KEY, isOn Boolean, simpleYear INTEGER, simpleYear INTEGER, simpleMonth INTEGER, simpleDay INTEGER, simpleTime REAL)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  void addAlarm(Alarm alrm) {
    _addAlarm(alrm);
  }

  Future<void> _addAlarm(Alarm alrm) async {
// Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'alarms',
      alrm.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  List<Alarm> alarms() {
    dynamic cur;
    _alarms().then((value) => cur = value);
    return cur;
  }

// A method that retrieves all the dogs from the dogs table.
  Future<List<Alarm>> _alarms() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('alarms');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Alarm(
        id: maps[i]['id'],
        isOn: maps[i]['isOn'],
        stime: maps[i]['simpleTime'],
        sday: maps[i]['simpleDay'],
        smonth: maps[i]['simpleMonth'],
        syear: maps[i]['simpleYear'],
      );
    });
  }

  void updateAlarm(Alarm alarm) {
    _updateAlarm(alarm);
  }

  Future<void> _updateAlarm(Alarm alarm) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'alarms',
      alarm.toMap(),
      // Ensure that the Alarm has a matching id.
      where: 'id = ?',
      // Pass the Alarm's id as a whereArg to prevent SQL injection.
      whereArgs: [alarm.id],
    );
  }

  void deleteAlarm(int id) {
    _deleteAlarm(id);
  }

  Future<void> _deleteAlarm(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'alarms',
      // Use a `where` clause to delete a specific alarm.
      where: 'id = ?',
      // Pass the Alarm's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  // Future _getStoragePermission() async {
  //   if (await Permission.storage.request().isGranted) {
  //     setState(() {
  //       permissionGranted = true;
  //     });
  //   } else if (await Permission.storage.request().isPermanentlyDenied) {
  //     await openAppSettings();
  //   } else if (await Permission.storage.request().isDenied) {
  //     setState(() {
  //       permissionGranted = false;
  //     });
  //   }
  // }
}
