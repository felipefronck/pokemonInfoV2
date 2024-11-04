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
  ValueNotifier<List<PokemonModel>> pokemonsFiltrados = ValueNotifier([]);

  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final moveController = TextEditingController();

  Future<void> loadPokemonsDb(BuildContext context) async {
    try {
      final pokemonsDb = await dbController.getPokemons();
      pokemons.value = pokemonsDb;
      pokemonsFiltrados.value = pokemonsDb;

    } catch (e) {
      showErroLoadDb(context, '$e');
    }
  }
  
  onSubmittedPokemonSearch(query, BuildContext context) async {
    try {
      PokemonModel result = await apiService.getAll(query);
      await dbController.insertPokemon(result);

      // pokemons.value = [... pokemons.value, result]; //inserindo ao final da lista
      await loadPokemonsDb(context);

    } catch (e) {
      showErroInserPokemon(context, '$e');
    }
  }

  Future<void> deletePokemon(int id) async {
    await dbController.deletePokemon(id);
    pokemons.value = pokemons.value.where((pokemon) => pokemon.id != id).toList();
  }

  void filter() {
    final nameFilter = nameController.text.toLowerCase();
    final typeFilter = typeController.text.toLowerCase();
    final moveFilter = moveController.text.toLowerCase();

    pokemonsFiltrados.value = pokemons.value.where((pokemon) {
      final nameMatch = pokemon.name.toLowerCase().contains(nameFilter);
      final typeMatch = pokemon.types.any((type) => type.toLowerCase().contains(typeFilter));
      final moveMatch = pokemon.moves.any((move) => move.toLowerCase().contains(moveFilter));

      return nameMatch && typeMatch && moveMatch;
    }).toList();
  }
}