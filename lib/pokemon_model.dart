class PokemonModel {
  final int id;
  final String name;
  final String imgpath;
  List<String> moves = [];
  List<String> types = [];

  PokemonModel({
    required this.id, 
    required this.name, 
    required this.imgpath, 
    required this.moves, 
    required this.types,
  });

  static PokemonModel fromJson(Map<String, dynamic> map){
    return PokemonModel(
        id: map['id'], 
        name: map['name'],
        imgpath: map['sprites']['other']['showdown']['front_default'] ?? '', 
        moves: List<String>.from(map['moves'].map((move) => move['move']['name'])), 
        types: List<String>.from(map['types'].map((type) => type['type']['name'])),
      );
  }
}
