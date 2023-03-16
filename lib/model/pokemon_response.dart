class PokenmonList {
  final String name;
  final String id;
  final String imageurl;
  final String xdescription;
  final String ydescription;
  final String height;
  final String category;
  final String weight;
  final List typeofpokemon;
  final List weaknesses;
  final List evolutions;
  final List abilities;
  final int hp;
  final int attack;
  final int defense;
  final int special_attack;
  final int special_defense;
  final int speed;
  final int total;
  final String male_percentage;
  final String female_percentage;
  final int genderless;
  final String cycles;
  final String egg_groups;
  final String evolvedfrom;
  final String reason;
  final String base_exp;

  PokenmonList({
    required this.name,
    required this.id,
    required this.imageurl,
    required this.xdescription,
    required this.ydescription,
    required this.height,
    required this.category,
    required this.weight,
    required this.typeofpokemon,
    required this.weaknesses,
    required this.evolutions,
    required this.abilities,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.special_attack,
    required this.special_defense,
    required this.speed,
    required this.total,
    required this.male_percentage,
    required this.female_percentage,
    required this.genderless,
    required this.cycles,
    required this.egg_groups,
    required this.evolvedfrom,
    required this.reason,
    required this.base_exp
  });

  factory
  PokenmonList.fromJson
      (Map<String, dynamic> json) {
    return PokenmonList(
        name: json["name"] ?? "",
        id: json["id"] ?? "",
        imageurl: json["imageurl"] ?? "",
        xdescription: json["xdescription"] ?? "",
        ydescription: json["ydescription"] ?? "",
        height:json["height"] ?? "",
        category: json["category"] ?? "",
        weight: json["weight"] ?? "",
        typeofpokemon: json["typeofpokemon"] ?? "",
        weaknesses: json["weaknesses"] ?? "",
        evolutions: json["evolutions"]?? "",
        abilities: json["abilities"] ?? "",
        hp: json["hp"] ?? "",
        attack: json["attack"] ?? "",
        defense: json["defense"] ?? "",
        special_attack: json["special_attack"] ?? "",
        special_defense: json["special_defense"] ?? "",
        speed: json["speed"] ?? "",
        total: json["total"] ?? "",
        male_percentage: json["male_percentage"] ?? "",
        female_percentage: json["female_percentage"] ?? "",
        genderless: json["genderless"] ?? "",
        cycles: json["cycles"] ?? "",
        egg_groups: json["egg_groups"] ?? "",
        evolvedfrom: json["evolvedfrom"] ?? "",
        reason: json["reason"] ?? "",
        base_exp: json["base_exp"] ?? ""
    );
  }
}
