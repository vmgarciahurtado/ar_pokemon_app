import 'package:ar_pokemon_app/pokemon_list.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PokemonList(),
    ),
  );
}
