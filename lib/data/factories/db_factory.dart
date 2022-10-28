
import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseFactory{
  Future<Database> createDatabase(String userId) async{
    String databasePath = await getDatabasesPath();
    String dbPath = join(databasePath, '$userId.db');
    var database = await openDatabase(dbPath, version: 3, onCreate: populateDb, onUpgrade: onUpgrade);
    correctDatabaseDamagedTables(database);
    return database;
  }


  void correctDatabaseDamagedTables(Database db) async{
    await _createHistoryTable(db);
  }

  void onUpgrade(Database db, int oldVersion, int newVersion) async{

  }
  void populateDb(Database db, int version) async{
    await _createHistoryTable(db);
  }

  _createHistoryTable(Database db) async{
    await db
        .execute(
      '''CREATE TABLE IF NOT EXISTS history(
      id INTEGER PRIMARY KEY,
      coupon_id INTEGER NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
      )'''
    );
  }

}