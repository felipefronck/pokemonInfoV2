import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/controllers/pokemon_controller.dart';
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
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea( 
        child: ValueListenableBuilder(
          valueListenable: controller.pokemons,
          builder:(context, pokemons, _) {
            return Column(
              children: [
                InputWidget(
                  onSubmittedPokemonSearch: (query) {
                    controller.onSubmittedPokemonSearch(query);
                  },
                ),
                const FilterWidget(),
                Expanded(
                  child: PokemonGridviewWidget(pokemons: pokemons)
                  )
              ]
            );
          },
        )
      )
    );
  }
}