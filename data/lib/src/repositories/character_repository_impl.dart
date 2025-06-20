part of repositories;

final class CharacterRepositoryImpl implements CharacterRepository {
  final ApiProvider _apiProvider;

  CharacterRepositoryImpl({
    required ApiProvider apiProvider,
  }) : _apiProvider = apiProvider;

  @override
  Future<List<Character>> fetchCharacters() async {
    final List<CharacterEntity> entities = await _apiProvider.fetchCharacters();

    return entities
        .map((CharacterEntity entity) =>
            MapperFactory.characterMapper.fromEntity(entity))
        .toList();
  }
}
