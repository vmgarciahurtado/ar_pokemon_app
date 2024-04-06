class PokemonModel {
  int id;
  String name;
  String imageUrl;

  PokemonModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
      };
}
