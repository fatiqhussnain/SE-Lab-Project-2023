import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SqlHelper {
  static Future<void> createTables(Database db)async {
    print('çreateTables is called   ');
    db.execute("""
            CREATE TABLE IF NOT EXISTS Budget (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            label TEXT,
            iconString TEXT,
            amount REAL,
            createdAt TEXT,
            updatedAt TEXT,
            active INTEGER
            );
            
            CREATE TABLE IF NOT EXISTS Reminders (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                label TEXT,
                type TEXT,
                time TEXT,
                creatdAt TEXT, 
                updatedAt TEXT,
                FOREIGN KEY(type) REFERENCES Budget(id)
            );
            
            CREATE TABLE IF NOT EXISTS Transactions (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                direction INTEGER,
                label TEXT,
                description TEXT,
                amount REAL,
                type TEXT,
                createdAt TEXT,
                updatedAt TEXT,
                active INTEGER,
                FOREIGN KEY(type) REFERENCES Budget(id)
            );

            
            CREATE TABLE IF NOT EXISTS Transfers (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            amount REAL,
            direction INTEGER,
            label TEXT,
            description TEXT,
            createdAt TEXT,
            updatedAt TEXT,
            active INTEGER
            );
            
            CREATE TABLE IF NOT EXISTS Savings (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            amount REAL,
            direction INTEGER,
            label TEXT,
            description TEXT,
            createdAt TEXT,
            updatedAt TEXT,
            active INTEGER
            );
            
            """"");
    print("sdcard ${db.path}");
  }
  static Future<Database> db() async {
    print('db is called   ');

    var db = openDatabase (
      'cashflo.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
    Database d = await db;
    createTables(d);
    return db;
  }

  static Future<void> deleteMyDatabase() async {
    print('deleteMyDatabase is called   ');
    await deleteDatabase('cashflo.db');
  }



}