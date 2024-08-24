import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/features/home_screen/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/features/home_screen/domain/repository/character_repository.dart';

part 'characters_list_event.dart';
part 'characters_list_state.dart';

class CharactersListBloc
    extends Bloc<CharactersListEvent, CharactersListState> {
  final CharacterRepository repository;
  CharactersListBloc({
    required this.repository,
  }) : super(CharactersListInitial()) {
    on<GetCharacterListEvent>(_onGetCharacterListEvent);
  }

  FutureOr<void> _onGetCharacterListEvent(
      GetCharacterListEvent event, Emitter<CharactersListState> emit) async {
    emit(CharactersListLoadingState());
    final response = await repository.getList();
    response.when(ok: (data) {
      emit(CharactersListLoadedState(characterList: data));
    }, err: (error) {
      emit(
        CharactersListErrorState(
          message: error.toString(),
        ),
      );
    });
  }
}
