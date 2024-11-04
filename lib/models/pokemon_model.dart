import 'dart:convert';

class PokemonModel {
  final int id;
  final String name;
  final String imgpath;
  List<String> moves;
  List<String> types;

  PokemonModel({
    required this.id, 
    required this.name, 
    required this.imgpath, 
    required this.moves, 
    required this.types,
  });
    //construtor para um pokemonmodel a partir da resp da api
  factory PokemonModel.fromApi(Map<String, dynamic> apiResponse){
    return PokemonModel(
        id: apiResponse['id'], 
        name: apiResponse['name'],
        imgpath: apiResponse['sprites']['other']['showdown']['front_default'] ?? apiResponse['sprites']['front_default'], 
        moves: List<String>.from(apiResponse['moves'].map((move) => move['move']['name'])),
        types: List<String>.from(apiResponse['types'].map((type) => type['type']['name'])),
      );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': name,
      'img': imgpath,
      'movimentos': jsonEncode(moves),
      'tipos': jsonEncode(types),
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map){
    return PokemonModel(
      id: map['id'],
      name: map['nome'],
      imgpath: map['img'],
      moves: List<String>.from(jsonDecode(map['movimentos'])),
      types: List<String>.from(jsonDecode(map['tipos']))
    );
  }
}
