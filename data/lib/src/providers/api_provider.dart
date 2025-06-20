part of providers;

final class ApiProvider {
  final Dio _dio;
  final ErrorHandler _errorHandler;

  const ApiProvider({
    required Dio dio,
    required ErrorHandler errorHandler,
  })  : _dio = dio,
        _errorHandler = errorHandler;

  Future<List<CharacterEntity>> fetchCharacters() async {
    try {
      final Response<dynamic> response = await _dio.get(
        DataConstants.characterEndpoint,
      );

      final List<dynamic> results = response.data as List<dynamic>;

      return results
          .map((dynamic json) =>
              CharacterEntity.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      _errorHandler.handleError(e);
    }
  }
}
