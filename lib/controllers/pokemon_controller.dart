// ignore_for_file: use_build_context_synchronously
import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/controllers/db_controller.dart';
import 'package:pokemon_info_2/models/pokemon_model.dart';
import 'package:pokemon_info_2/services/api_service.dart';
import 'package:pokemon_info_2/widgets/dialog_carregamento_api_widget.dart';
import 'package:pokemon_info_2/widgets/dialog_insert_pokemon_widget.dart';

class PokemonController {
  final DatabaseController dbController = DatabaseController();
  final ApiService apiService = ApiService();
  ValueNotifier<List<PokemonModel>> pokemons = ValueNotifier([]);

  Future<void> loadPokemonsDb(BuildContext context) async {
    try {
      final pokemonsDb = await dbController.getPokemons();
      pokemons.value = pokemonsDb;
    } catch (e) {
      showErroLoadDb(context, '$e');
    }
  }
  
  onSubmittedPokemonSearch(query, BuildContext context) async {
    try {
      PokemonModel result = await apiService.getAll(query);
      pokemons.value = [... pokemons.value, result];

      await dbController.insertPokemon(result);
    } catch (e) {
      showErroInserPokemon(context, '$e');
    }
  }

  Future<void> deletePokemon(int id) async {
    await dbController.deletePokemon(id);
    pokemons.value = pokemons.value.where((pokemon) => pokemon.id != id).toList();
  }
}