part of models;

final class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String hair;
  final String origin;
  final List<String> alias;
  final List<String> abilities;
  final String imageUrl;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.hair,
    required this.origin,
    required this.alias,
    required this.abilities,
    required this.imageUrl,
  });
}
