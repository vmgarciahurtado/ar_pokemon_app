import 'dart:convert';

import 'package:ar_pokemon_app/podemon_model.dart';
import 'package:ar_pokemon_app/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PokemonList extends StatelessWidget {
  PokemonList({super.key});

  final Future pokemonJsonList =
      rootBundle.loadString('assets/pokemon_list.json');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
              future: pokemonJsonList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final jsonList = json.decode(snapshot.data) as List<dynamic>;
                  final pokemonList =
                      jsonList.map((e) => PokemonModel.fromJson(e)).toList();

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: GridView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      itemCount: pokemonList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: (size.width / size.height) * 1.3,
                      ),
                      itemBuilder: (context, int index) {
                        return PokemonCard(pokemonModel: pokemonList[index]);
                      },
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              })),
    );
  }
}
