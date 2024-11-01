import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/models/pokemon_model.dart';
import 'package:pokemon_info_2/services/api_service.dart';

class PokemonController {
  final ApiService apiService = ApiService();
  ValueNotifier<List<PokemonModel>> pokemons = ValueNotifier([]);

  onSubmittedPokemonSearch(query) async {
    try {
      PokemonModel result = await apiService.getAll(query);
      pokemons.value.add(result);
      
    } catch (e) {
      //TODO
    }
  }
}