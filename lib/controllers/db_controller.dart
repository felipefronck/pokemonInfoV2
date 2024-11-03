import 'package:pokemon_info_2/services/db.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseController {

  Future<List<Map<String, dynamic>>> getDatabase() async{
    final db = await Db.instance.database;

    return await db.query('pokemon');
  }

  Future<void> inserirPokemon(int id, String nome, String img, String movimentos, String tipos) async {
    final db = await Db.instance.database;

    await db.insert(
      'pokemon',{
        'id': id,
        'nome': nome,
        'img': img,
        'movimentos': movimentos,
        'tipos': tipos
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}