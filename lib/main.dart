import 'package:favorites_list/src/components/navigationcomponent.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/state/pokemon_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PokemonProvider(), // Aqui é onde você cria o PokemonProvider
      child: const NavigationBarApp(),
    ),
  );
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const NavigationComponent(),
    );
  }
}
