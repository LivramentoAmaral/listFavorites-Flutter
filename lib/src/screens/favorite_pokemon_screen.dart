import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/pokemon_provider.dart';
import '../model/pokemon.dart';

class FavoritePokemonScreen extends StatelessWidget {
  const FavoritePokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Favoritos'),
      ),
      body: Consumer<PokemonProvider>(
        builder: (context, pokemonProvider, child) {
          final List<Pokemon> favoritePokemonList =
              pokemonProvider.favoritePokemonList;
          return favoritePokemonList.isEmpty
              ? const Center(child: Text('No favorites yet'))
              : ListView.builder(
                  itemCount: favoritePokemonList.length,
                  itemBuilder: (context, index) {
                    final Pokemon pokemon = favoritePokemonList[index];
                    // ignore: unnecessary_null_comparison
                    final imageUrl = pokemon.id != null
                        ? 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon.id}.png'
                        : null;

                    return ListTile(
                      title: Text(pokemon.name),
                      leading: imageUrl != null
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(imageUrl),
                            )
                          : const CircleAvatar(
                              child: Icon(Icons.image_not_supported),
                            ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _showDeleteConfirmationDialog(
                            context,
                            pokemonProvider,
                            pokemon,
                          );
                        },
                      ),
                    );
                  },
                );
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, PokemonProvider pokemonProvider, Pokemon pokemon) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remover dos Favoritos'),
        content: const Text(
            'Tem certeza de que deseja remover este Pokémon dos seus favoritos?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              pokemonProvider.toggleFavoriteStatus(pokemon);
              Navigator.of(context).pop();
            },
            child: const Text('Remover'),
          ),
        ],
      ),
    );
  }
}
