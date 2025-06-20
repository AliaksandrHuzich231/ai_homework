part of 'home_page_bloc.dart';

abstract class HomePageEvent {
  const HomePageEvent();
}

final class Init extends HomePageEvent {
  const Init();
}

final class SearchByName extends HomePageEvent {
  final String query;

  const SearchByName({required this.query});
}

final class NavigateToDetails extends HomePageEvent {
  final Character character;

  const NavigateToDetails({required this.character});
}
