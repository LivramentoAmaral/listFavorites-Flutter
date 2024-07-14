// lib/src/screen/favorite_pokemon_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/pokemon_provider.dart';
import '../model/pokemon.dart';

class FavoritePokemonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Pokémon'),
      ),
      body: Consumer<PokemonProvider>(
        builder: (context, pokemonProvider, child) {
          final List<Pokemon> favoritePokemonList = pokemonProvider.favoritePokemonList;
          return favoritePokemonList.isEmpty
              ? const Center(child: Text('No favorites yet'))
              : ListView.builder(
                  itemCount: favoritePokemonList.length,
                  itemBuilder: (context, index) {
                    final Pokemon pokemon = favoritePokemonList[index];
                    return ListTile(
                      title: Text(pokemon.name),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon.id}.png',
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          pokemonProvider.toggleFavoriteStatus(pokemon);
                        },
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
