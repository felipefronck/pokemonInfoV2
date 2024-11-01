import 'package:dio/dio.dart';
import 'package:pokemon_info_2/pokemon_model.dart';

class ApiService {
  final url = "https://pokeapi.co/api/v2/pokemon/";
  final dio = Dio();

  Future<PokemonModel> getAll(String query) async{
    final response = await dio.get('$url$query');

    return PokemonModel.fromJson(response.data);
  }
}