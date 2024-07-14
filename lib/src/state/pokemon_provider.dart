// lib/src/state/pokemon_provider.dart

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/pokemon.dart';

class PokemonProvider with ChangeNotifier {
  List<Pokemon> _pokemonList = [];
  List<Pokemon> get pokemonList => _pokemonList;

  PokemonProvider() {
    // Inicializa o carregamento dos Pokémon
    fetchPokemonList();
  }

  Future<void> fetchPokemonList() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'));
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> results = decoded['results'];

      _pokemonList = results.map((json) => Pokemon.fromJson(json)).toList();

      // Inicializa os favoritos (simulação de dados para exemplo)
      for (var pokemon in _pokemonList) {
        pokemon.isFavorite = false; // Inicialmente nenhum é favorito
      }

      notifyListeners();
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }

  void toggleFavoriteStatus(Pokemon pokemon) {
    pokemon.isFavorite = !pokemon.isFavorite;
    notifyListeners();
  }

  List<Pokemon> get favoritePokemonList {
    return _pokemonList.where((pokemon) => pokemon.isFavorite).toList();
  }
}
