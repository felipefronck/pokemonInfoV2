import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/controllers/pokemon_controller.dart';
import 'package:pokemon_info_2/widgets/dialog_exclusao_pokemon.dart';
import 'package:pokemon_info_2/widgets/filter_widget.dart';
import 'package:pokemon_info_2/widgets/input_widget.dart';
import 'package:pokemon_info_2/widgets/pokemon_gridview_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PokemonController controller = PokemonController();

  @override
  void initState() {
    super.initState();
    controller.loadPokemonsDb(context);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea( 
        child: ValueListenableBuilder(
          valueListenable: controller.pokemonsFiltrados,
          builder:(context, pokemonsFiltrados, _) {
            return Column(
              children: [
                InputWidget(
                  onSubmittedPokemonSearch: (query) {
                    controller.onSubmittedPokemonSearch(query, context);
                  },
                ),
                FilterWidget(
                  nameController: controller.nameController,
                  typeController: controller.typeController,
                  moveController: controller.moveController,
                  onFilter: controller.filter,
                ),
                Expanded(
                  child: PokemonGridviewWidget(
                    pokemons: pokemonsFiltrados,
                    controller: controller,
                    onDeletePokemon: (id) {
                      // controller.deletePokemon(id);
                      showExcluirPokemon(context, id, controller);
                    })
                  )
              ]
            );
          },
        )
      )
    );
  }
}