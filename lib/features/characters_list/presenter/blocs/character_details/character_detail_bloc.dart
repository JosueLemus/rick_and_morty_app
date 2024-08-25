import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'character_detail_event.dart';
part 'character_detail_state.dart';

class CharacterDetailBloc extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  CharacterDetailBloc() : super(CharacterDetailInitial()) {
    on<CharacterDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
