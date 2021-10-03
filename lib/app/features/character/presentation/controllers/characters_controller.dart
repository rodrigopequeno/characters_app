import 'package:mobx/mobx.dart';

import '../../../../core/controllers/infinite_paging_controller.dart';
import '../../domain/entities/character.dart';
import '../../domain/usecases/get_characters.dart';

part 'characters_controller.g.dart';

class CharactersController = _CharactersControllerBase
    with _$CharactersController;

abstract class _CharactersControllerBase
    extends InfinitePagingController<Character, GetCharactersParams>
    with Store {
  final GetCharacters getCharacters;

  _CharactersControllerBase({
    required this.getCharacters,
  });

  @computed
  List<Character> get characters => List<Character>.from(objects);

  @observable
  bool _snackBarIsVisible = false;
  @computed
  bool get snackBarIsVisible => _snackBarIsVisible;
  // ignore: avoid_positional_boolean_parameters, use_setters_to_change_properties
  void setSnackBarIsVisible(bool newValue) {
    _snackBarIsVisible = newValue;
  }

  Future<void> loadCharacters({bool isRefresh = false}) => loadObjects(
        usecase: getCharacters,
        params: GetCharactersParams(),
        isRefresh: isRefresh,
      );

  Future<void> loadNextCharacters() => loadNextObjects(
        usecase: getCharacters,
        params: GetCharactersParams(next: true),
      );
}
