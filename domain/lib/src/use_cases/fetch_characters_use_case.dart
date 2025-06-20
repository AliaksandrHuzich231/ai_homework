part of use_cases;

class FetchCharactersUseCase
    extends FutureUseCase<NoParams, List<Character>> {
  final CharacterRepository _characterRepository;

  FetchCharactersUseCase({
    required CharacterRepository characterRepository,
  }) : _characterRepository = characterRepository;

  @override
  Future<List<Character>> execute(NoParams input) async {
    return _characterRepository.fetchCharacters();
  }
}
