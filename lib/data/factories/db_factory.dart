
import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseFactory{
  Future<Database> createDatabase(String userId) async{
    String databasePath = await getDatabasesPath();
    String dbPath = join(databasePath, userId + '.db');
    var database = await openDatabase(dbPath, version: 3, onCreate: populateDb, onUpgrade: onUpgrade);
    correctDatabaseDamagedTables(database);
    return database;
  }


  void correctDatabaseDamagedTables(Database db) async{
    await _maybeCreatePerformanceReportsTable(db);
  }

  void onUpgrade(Database db, int oldVersion, int newVersion) async{
    if(oldVersion < newVersion){
      await _maybeCreatePerformanceReportsTable(db);
    }

  }
  void populateDb(Database db, int version) async{
    await _createChatTable(db);
    await _createMessagesTable(db);
  }

  _maybeCreatePerformanceReportsTable(Database db) async{
    await db
        .execute(
      '''CREATE TABLE IF NOT EXISTS performance_reports(
      id TEXT PRIMARY KEY,
      received_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
      local_url TEXT
      )'''
    );
  }

  _createChatTable(Database db) async{
    await db
        .execute(
      '''CREATE TABLE IF NOT EXISTS chats(
      id TEXT PRIMARY KEY,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
      )'''
    );
  }

  _createMessagesTable(Database db) async{
    await db
        .execute('''
        CREATE TABLE IF NOT EXISTS messages(
          chat_id TEXT NOT NULL,
          id TEXT PRIMARY KEY,
          sender TEXT NOT NULL,
          receiver TEXT NOT NULL,
          message TEXT NOT NULL,
          receipt TEXT NOT NULL,
          type TEXT NOT NULL,
          remote_url TEXT,
          local_url TEXT,
          received_at TIMESTAMP NOT NULL,
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
          )
        ''');
  }

}