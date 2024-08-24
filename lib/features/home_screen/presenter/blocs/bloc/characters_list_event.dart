part of 'characters_list_bloc.dart';

sealed class CharactersListEvent extends Equatable {
  const CharactersListEvent();

  @override
  List<Object> get props => [];
}

class GetCharacterListEvent extends CharactersListEvent {
  final int page;

  const GetCharacterListEvent({
    required this.page,
  });
}
