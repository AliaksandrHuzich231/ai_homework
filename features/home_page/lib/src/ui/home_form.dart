import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_page_bloc.dart';
import 'widgets/character_tile.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (BuildContext context, HomePageState state) {
        if (state.isPageLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              LocaleKeys.character_appTitle.watchTr(context),
            ),
            centerTitle: true,
            backgroundColor: AppColors.white,
            surfaceTintColor: Colors.transparent,
          ),
          body: Column(
            children: <Widget>[
              Container(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SearchField(
                    controller: _searchController,
                    onChanged: (String query) {
                      context
                          .read<HomePageBloc>()
                          .add(SearchByName(query: query));
                    },
                    label: LocaleKeys.character_searchHint.watchTr(context),
                    focusNode: _searchFocusNode,
                    onClear: () {
                      _searchController.clear();
                      context
                          .read<HomePageBloc>()
                          .add(const SearchByName(query: ''));
                    },
                  ),
                ),
              ),
              Expanded(
                child: () {
                  if (state.hasException) {
                    return Center(
                      child: Text(
                        state.exception!.toLocalizedText(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: AppColors.red,
                        ),
                      ),
                    );
                  }

                  if (state.filteredCharacters.isEmpty) {
                    return state.isPageLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Center(
                            child: Text(
                              LocaleKeys.character_noResults.watchTr(context),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: AppColors.turquoise,
                              ),
                            ),
                          );
                  }

                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: state.filteredCharacters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CharacterTile(
                        character: state.filteredCharacters[index],
                        onTap: () {
                          context.read<HomePageBloc>().add(
                                NavigateToDetails(
                                  character: state.filteredCharacters[index],
                                ),
                              );
                        },
                      );
                    },
                  );
                }(),
              ),
            ],
          ),
        );
      },
    );
  }
}
