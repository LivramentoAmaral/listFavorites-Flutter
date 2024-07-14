import 'package:favorites_list/src/screens/favorite_pokemon_screen.dart';
import 'package:favorites_list/src/screens/pokemon_list_screen.dart';
import 'package:flutter/material.dart';


class NavigationComponent extends StatefulWidget {
  const NavigationComponent({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavigationComponentState createState() => _NavigationComponentState();
}

class _NavigationComponentState extends State<NavigationComponent> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Theme.of(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pokémon List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite Pokémon',
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentPageIndex,
        children: <Widget>[
          PokemonListScreen(), // Primeira tela: Lista de Pokémon
          FavoritePokemonScreen(), // Segunda tela: Lista de Pokémon favoritos
        ],
      ),
    );
  }
}
