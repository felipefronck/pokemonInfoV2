import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/controllers/pokemon_controller.dart';
import 'package:pokemon_info_2/widgets/dialogs/dialog_exclusao_pokemon.dart';
import 'package:pokemon_info_2/widgets/filter_widget.dart';
import 'package:pokemon_info_2/widgets/input_widget.dart';
import 'package:pokemon_info_2/widgets/pokemon_gridview_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PokemonController pkController = PokemonController();

  @override
  void initState() {
    super.initState();
    pkController.loadPokemonsDb(context);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea( 
        child: ValueListenableBuilder(
          valueListenable: pkController.pokemonsFiltrados,
          builder:(context, pokemonsFiltrados, _) {
            return Column(
              children: [
                InputWidget(
                  onSubmittedPokemonSearch: (query) {
                    pkController.onSubmittedPokemonSearch(query, context);
                  },
                ),
                FilterWidget(
                  nameController: pkController.nameController,
                  typeController: pkController.typeController,
                  moveController: pkController.moveController,
                  onFilter: () => pkController.filter(context),
                ),
                Expanded(
                  child: PokemonGridviewWidget(
                    pokemons: pokemonsFiltrados,
                    controller: pkController,
                    onDeletePokemon: (id) {
                      // controller.deletePokemon(id);
                      showExcluirPokemon(context, id, pkController);
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