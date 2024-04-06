import 'package:ar_pokemon_app/podemon_model.dart';
import 'package:ar_pokemon_app/pokemon_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemonModel;

  const PokemonCard({
    super.key,
    required this.pokemonModel,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PokemonDetailScreen(
                    prefab: (pokemonModel.id).toString(),
                  )),
        );
      },
      child: Card(
        elevation: 1,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                    height: size.height * 0.45 * 0.40,
                    child: CachedNetworkImage(
                      imageUrl: pokemonModel.imageUrl,
                      placeholder: (context, url) =>
                          const CupertinoActivityIndicator(
                        color: Colors.red,
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "#${pokemonModel.id}",
                maxLines: 2,
              )),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 150),
                child: Center(
                  child: Text(
                    pokemonModel.name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
