// lib/src/repository/pokemon_repository.dart

import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonRepository {
  Future<List<Map<String, dynamic>>> fetchPokemonList() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=20'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'] as List;
      return data.map((json) => json as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }
}
