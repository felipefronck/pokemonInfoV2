import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db {
  static final Db instance = Db._();
  static Database? _database;

  Db._();

  Future<Database> get database async {
    if (_database != null){
      return _database!;
    } else {
      return await _initDatabase();
    }
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'pokemon.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void>_onCreate(Database db, int version) async {
    await db.execute(_pokemon);
  }

  String get _pokemon => '''
    CREATE TABLE pokemon (
      id INTEGER PRIMARY KEY,
      nome TEXT,
      img TEXT,
      movimentos TEXT,
      tipos TEXT
    );
  ''';
}