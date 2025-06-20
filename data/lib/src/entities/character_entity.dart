import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
final class CharacterEntity {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;

  final String hair;
  final String origin;
  final List<String> alias;
  final List<String> abilities;

  @JsonKey(name: 'img_url')
  final String imageUrl;

  const CharacterEntity({
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

  factory CharacterEntity.fromJson(Map<String, dynamic> json) {
    return CharacterEntity(
      id: json['id'] as int,
      name: json['name']?.toString() ?? '',
      status: json['status']?.toString() ?? '',
      species: json['species']?.toString() ?? '',
      gender: json['gender']?.toString() ?? '',
      hair: json['hair']?.toString() ?? '',
      origin: json['origin']?.toString() ?? 'Unknown',
      alias: (json['alias'] as List?)?.map((e) => e.toString()).toList() ??
          const <String>[],
      abilities:
          (json['abilities'] as List?)?.map((e) => e.toString()).toList() ??
              const <String>[],
      imageUrl: json['img_url']?.toString() ?? '',
    );
  }
}
