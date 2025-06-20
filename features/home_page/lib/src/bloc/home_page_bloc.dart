import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import '../../home_page.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final FetchCharactersUseCase _fetchCharactersUseCase;
  final AppRouter _appRouter;

  HomePageBloc({
    required FetchCharactersUseCase fetchCharactersUseCase,
    required AppRouter appRouter,
  })  : _fetchCharactersUseCase = fetchCharactersUseCase,
        _appRouter = appRouter,
        super(const HomePageState.initial()) {
    on<Init>(_onInit);
    on<SearchByName>(_onSearchByName);
    on<NavigateToDetails>(_onNavigateToDetails);

    add(const Init());
  }

  Future<void> _onInit(
    Init event,
    Emitter<HomePageState> emit,
  ) async {
    emit(state.copyWith(
      isPageLoading: true,
      exception: () => null,
      allCharacters: <Character>[],
      filteredCharacters: <Character>[],
    ));

    try {
      final List<Character> characters =
          await _fetchCharactersUseCase.execute(const NoParams());

      emit(state.copyWith(
        allCharacters: characters,
        filteredCharacters: characters,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(exception: () => e));
    } finally {
      emit(state.copyWith(isPageLoading: false));
    }
  }

  void _onSearchByName(
    SearchByName event,
    Emitter<HomePageState> emit,
  ) {
    final String query = event.query.trim().toLowerCase();

    if (query.isEmpty) {
      emit(state.copyWith(
        searchQuery: () => '',
        filteredCharacters: state.allCharacters,
      ));
      return;
    }

    final List<Character> filtered = state.allCharacters
        .where((Character c) => c.name.toLowerCase().startsWith(query))
        .toList();

    emit(state.copyWith(
      searchQuery: () => query,
      filteredCharacters: filtered,
    ));
  }

  Future<void> _onNavigateToDetails(
    NavigateToDetails event,
    Emitter<HomePageState> emit,
  ) async {
    await _appRouter.push(
      DetailedCharacterRoute(character: event.character),
    );
  }
}
