import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db {
  
  Db._();

  static final Db instance = Db._();
  static Database? _database;

  get database async {
    if (_database != null){
      // ignore: recursive_getters
      return database;
    } else {
      return await _initDatabase();
    }
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'pokemon.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
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