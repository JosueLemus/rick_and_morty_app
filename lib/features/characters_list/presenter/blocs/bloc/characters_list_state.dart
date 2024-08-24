part of 'characters_list_bloc.dart';

sealed class CharactersListState extends Equatable {
  const CharactersListState();

  @override
  List<Object> get props => [];
}

final class CharactersListInitial extends CharactersListState {}

final class CharactersListLoadingState extends CharactersListState {}

final class CharactersListErrorState extends CharactersListState {
  final String message;

  const CharactersListErrorState({
    required this.message,
  });
}

final class CharactersListLoadedState extends CharactersListState {
  final List<CharacterEntity> characterList;

  const CharactersListLoadedState({
    required this.characterList,
  });
}
