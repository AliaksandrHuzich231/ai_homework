import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/home_page_bloc.dart';
import 'home_form.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageBloc>(
      create: (_) => HomePageBloc(
        fetchCharactersUseCase: appLocator.get<FetchCharactersUseCase>(),
        appRouter: appLocator.get<AppRouter>(),
      ),
      child: const HomeForm(),
    );
  }
}
