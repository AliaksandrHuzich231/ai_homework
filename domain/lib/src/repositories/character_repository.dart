part of repositories;

abstract interface class CharacterRepository {
  Future<List<Character>> fetchCharacters();
}
