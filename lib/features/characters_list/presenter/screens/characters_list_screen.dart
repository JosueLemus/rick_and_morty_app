import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/characters_list/data/api/character_api.dart';
import 'package:rick_and_morty_app/features/characters_list/presenter/blocs/character_list/characters_list_bloc.dart';

class CharactersListScreen extends StatelessWidget {
  const CharactersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersListBloc(
        repository: CharacterApi(),
      )..add(
          const GetCharacterListEvent(
            page: 1,
          ),
        ),
      child: Scaffold(
        body: _Page(),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersListBloc, CharactersListState>(
      builder: (context, state) {
        if (state is CharactersListLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CharactersListLoadedState) {
          return ListView.builder(
              itemCount: state.characterList.length,
              itemBuilder: (context, index) {
                final character = state.characterList[index];
                return ListTile(
                  title: Text(character.name),
                  leading: Image.network(character.image),
                  subtitle: Text(
                    character.species,
                  ),
                );
              });
        }
        return Container();
      },
    );
  }
}
