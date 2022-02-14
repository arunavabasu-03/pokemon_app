import 'dart:convert';

List<Pokemon> pokemonFromJson(String str) =>
    List<Pokemon>.from(json.decode(str).map((x) => Pokemon.fromJson(x)));

String pokemonToJson(List<Pokemon> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pokemon {
  Pokemon({
    this.number,
    required this.name,
    this.slug,
    required this.weight,
    required this.height,
    this.abilities,
    this.weakness,
    this.type,
    this.thumbnailAltText,
    required this.thumbnailImage,
  });

  String? number;
  String name;
  String? slug;
  double weight;
  double height;
  List<String>? abilities;
  List<Weakness>? weakness;
  List<Type>? type;
  String? thumbnailAltText;
  String thumbnailImage;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        number: json["number"],
        name: json["name"],
        slug: json["slug"],
        weight: json["weight"].toDouble(),
        height: json["height"].toDouble(),
        abilities: List<String>.from(json["abilities"].map((x) => x)),
        weakness: List<Weakness>.from(
            json["weakness"].map((x) => weaknessValues.map![x])),
        type: List<Type>.from(json["type"].map((x) => typeValues.map![x])),
        thumbnailAltText: json["ThumbnailAltText"],
        thumbnailImage: json["ThumbnailImage"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "slug": slug,
        "weight": weight,
        "height": height,
        "abilities": List<dynamic>.from(abilities!.map((x) => x)),
        "weakness": List<dynamic>.from(
            weakness!.map((x) => weaknessValues.reverse![x])),
        "type": List<dynamic>.from(type!.map((x) => typeValues.reverse![x])),
        "ThumbnailAltText": thumbnailAltText,
        "ThumbnailImage": thumbnailImage,
      };
}

enum Type {
  GRASS,
  POISON,
  FIRE,
  FLYING,
  WATER,
  BUG,
  NORMAL,
  ELECTRIC,
  GROUND,
  FAIRY,
  FIGHTING,
  PSYCHIC,
  ROCK,
  STEEL,
  ICE,
  GHOST,
  DRAGON,
  DARK
}

final typeValues = EnumValues({
  "bug": Type.BUG,
  "dark": Type.DARK,
  "dragon": Type.DRAGON,
  "electric": Type.ELECTRIC,
  "fairy": Type.FAIRY,
  "fighting": Type.FIGHTING,
  "fire": Type.FIRE,
  "flying": Type.FLYING,
  "ghost": Type.GHOST,
  "grass": Type.GRASS,
  "ground": Type.GROUND,
  "ice": Type.ICE,
  "normal": Type.NORMAL,
  "poison": Type.POISON,
  "psychic": Type.PSYCHIC,
  "rock": Type.ROCK,
  "steel": Type.STEEL,
  "water": Type.WATER
});

enum Weakness {
  FIRE,
  PSYCHIC,
  FLYING,
  ICE,
  WATER,
  GROUND,
  ROCK,
  ELECTRIC,
  GRASS,
  FIGHTING,
  STEEL,
  POISON,
  BUG,
  FAIRY,
  GHOST,
  DARK,
  DRAGON
}

final weaknessValues = EnumValues({
  "Bug": Weakness.BUG,
  "Dark": Weakness.DARK,
  "Dragon": Weakness.DRAGON,
  "Electric": Weakness.ELECTRIC,
  "Fairy": Weakness.FAIRY,
  "Fighting": Weakness.FIGHTING,
  "Fire": Weakness.FIRE,
  "Flying": Weakness.FLYING,
  "Ghost": Weakness.GHOST,
  "Grass": Weakness.GRASS,
  "Ground": Weakness.GROUND,
  "Ice": Weakness.ICE,
  "Poison": Weakness.POISON,
  "Psychic": Weakness.PSYCHIC,
  "Rock": Weakness.ROCK,
  "Steel": Weakness.STEEL,
  "Water": Weakness.WATER
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
