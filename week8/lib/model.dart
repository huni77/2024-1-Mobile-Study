import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Pokemon {

  final int id;
  final String name;
  final int weight;
  final Sprites sprites;

  Pokemon({
    required this.id,
    required this.name,
    required this.weight,
    required this.sprites,
  });
  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable()
class Sprites {
  final String front_default;
  final String back_default;
  Sprites({
    required this.front_default,
    required this.back_default,
});

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}
