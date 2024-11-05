import 'package:pokemon_info_2/models/pokemon_model.dart';
import 'package:pokemon_info_2/services/db.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseController {

  Future<List<PokemonModel>> getPokemons() async {
    final db = await Db.instance.database;
    final List<Map<String, dynamic>> pokemons = await db.query('pokemon');

    return List.generate(pokemons.length, (index) {
      return PokemonModel.fromMap(pokemons[index]);
    });
  }

  Future<void> insertPokemon(PokemonModel pokemon) async {
    final db = await Db.instance.database;

    await db.insert(
      'pokemon',
      pokemon.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deletePokemon(int id) async {
    final db = await Db.instance.database;

    await db.delete(
      'pokemon',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<PokemonModel>> filterPokemons({
    String? name,
    String? type,
    String? move,
  }) async {
    final db = await Db.instance.database;

    List<String> whereClause = [];
    List<String> whereArgs = [];

    if (name != null) {
      whereClause.add('nome LIKE ?');
      whereArgs.add('%$name%');
    }

    if (move != null) {
      whereClause.add('movimentos LIKE ?');
      whereArgs.add('%$move%');
    }

    if (type != null) {
      whereClause.add('tipos LIKE ?');
      whereArgs.add('%$type%');
    }

    final List<Map<String, dynamic>> maps = await db.query(
      'pokemon', 
      where: whereClause.join(" AND "),
      whereArgs: whereArgs,
    );

    return List.generate(maps.length, (index) {
      return PokemonModel.fromMap(maps[index]);
    });
  }
}