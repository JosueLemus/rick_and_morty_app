import 'package:oxidized/oxidized.dart';
import 'package:rick_and_morty_app/features/home_screen/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/shared/models/failure.dart';

abstract class CharacterRepository {
  Future<Result<List<CharacterEntity>, Failure>> getList();
}
