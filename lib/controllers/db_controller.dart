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
}