import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/controllers/db_controller.dart';
import 'package:pokemon_info_2/models/pokemon_model.dart';
import 'package:pokemon_info_2/services/api_service.dart';

class PokemonController {
  final DatabaseController dbController = DatabaseController();
  final ApiService apiService = ApiService();
  ValueNotifier<List<PokemonModel>> pokemons = ValueNotifier([]);

  Future<void> loadPokemonsDb() async {
    try {
      final pokemonsDb = await dbController.getPokemons();
      pokemons.value = pokemonsDb;
      print('Pokémons carregados do banco de dados: ${pokemons.value}');
    } catch (e) {
      print('Erro ao carregar Pokémons do banco de dados: $e');
    }
  }
  
  onSubmittedPokemonSearch(query) async {
    try {
      PokemonModel result = await apiService.getAll(query);
      pokemons.value = [... pokemons.value, result];
      print('Pokemon adicionado: ${result.name}');

      await dbController.insertPokemon(result);
      print('Pokemon salvo no bando de dados');
      
    } catch (e) {
      //TODO
    }
  }
}