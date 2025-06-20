part of mappers;

final class CharacterMapper extends Mapper<CharacterEntity, domain.Character> {
  @override
  domain.Character fromEntity(CharacterEntity entity) {
    return domain.Character(
      id: entity.id,
      name: entity.name,
      status: entity.status,
      species: entity.species,
      gender: entity.gender,
      hair: entity.hair,
      origin: entity.origin,
      alias: entity.alias,
      abilities: entity.abilities,
      imageUrl: entity.imageUrl,
    );
  }

  @override
  CharacterEntity toEntity(domain.Character item) {
    return CharacterEntity(
      id: item.id,
      name: item.name,
      status: item.status,
      species: item.species,
      gender: item.gender,
      hair: item.hair,
      origin: item.origin,
      alias: item.alias,
      abilities: item.abilities,
      imageUrl: item.imageUrl,
    );
  }
}
