// lib/src/routes/app_routes.dart

import 'package:favorites_list/src/screens/favorite_pokemon_screen.dart';
import 'package:favorites_list/src/screens/pokemon_list_screen.dart';
import 'package:flutter/material.dart';


final Map<String, WidgetBuilder> appRoutes = {
  
  '/': (context) => PokemonListScreen(),
  '/favorites': (context) => FavoritePokemonScreen(),
};
