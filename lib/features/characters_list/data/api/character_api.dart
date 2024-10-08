import 'dart:convert';

import 'package:oxidized/src/result.dart';
import 'package:rick_and_morty_app/features/characters_list/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/characters_list/domain/repository/character_repository.dart';
import 'package:rick_and_morty_app/shared/models/failure.dart';
import 'package:http/http.dart' as http;

class CharacterApi extends CharacterRepository {
  final String urlBase = 'rickandmortyapi.com';
  @override
  Future<Result<List<CharacterModel>, Failure>> getList() async {
    try {
      final url = Uri.https(
        urlBase,
        '/api/character',
      );
      var response = await http.get(
        url,
      );

      final jsonResponse = jsonDecode(response.body);

      final list = List<CharacterModel>.from(jsonResponse['results']
          .map((character) => CharacterModel.fromJson(character)));
      return Ok(list);
    } catch (e) {
      return Err(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
