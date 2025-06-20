part of 'home_page_bloc.dart';

final class HomePageState {
  final bool isPageLoading;
  final List<Character> allCharacters;
  final List<Character> filteredCharacters;
  final String? searchQuery;
  final AppException? exception;

  const HomePageState({
    required this.isPageLoading,
    required this.allCharacters,
    required this.filteredCharacters,
    required this.searchQuery,
    required this.exception,
  });

  const HomePageState.initial()
      : isPageLoading = true,
        allCharacters = const <Character>[],
        filteredCharacters = const <Character>[],
        searchQuery = null,
        exception = null;

  bool get hasException => exception != null;

  HomePageState copyWith({
    bool? isPageLoading,
    List<Character>? allCharacters,
    List<Character>? filteredCharacters,
    String? Function()? searchQuery,
    AppException? Function()? exception,
  }) {
    return HomePageState(
      isPageLoading: isPageLoading ?? this.isPageLoading,
      allCharacters: allCharacters ?? this.allCharacters,
      filteredCharacters: filteredCharacters ?? this.filteredCharacters,
      searchQuery: searchQuery != null ? searchQuery() : this.searchQuery,
      exception: exception != null ? exception() : this.exception,
    );
  }
}
