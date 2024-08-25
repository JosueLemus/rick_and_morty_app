part of 'character_detail_bloc.dart';

sealed class CharacterDetailState extends Equatable {
  const CharacterDetailState();
  
  @override
  List<Object> get props => [];
}

final class CharacterDetailInitial extends CharacterDetailState {}
