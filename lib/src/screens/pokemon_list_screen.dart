// lib/src/screen/item_list_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/pokemon_provider.dart';
import '../model/pokemon.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon List'),
      ),
      body: pokemonProvider.pokemonList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: pokemonProvider.pokemonList.length,
              itemBuilder: (context, index) {
                final Pokemon pokemon = pokemonProvider.pokemonList[index];
                return ListTile(
                  title: Text(pokemon.name),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      // Exemplo de imagem de placeholder, você pode ajustar conforme necessário
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      pokemon.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: pokemon.isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      pokemonProvider.toggleFavoriteStatus(pokemon);
                    },
                  ),
                );
              },
            ),
    );
  }
}
