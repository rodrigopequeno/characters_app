import 'package:characters_app/app/features/character/domain/entities/response_character.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/character.dart';
import '../../domain/usecases/get_characters.dart';

part 'characters_controller.g.dart';

class CharactersController = _CharactersControllerBase
    with _$CharactersController;

abstract class _CharactersControllerBase with Store {
  final GetCharacters getCharacters;

  _CharactersControllerBase({
    required this.getCharacters,
  });

  @observable
  bool _haveNext = true;
  @computed
  bool get haveNext => _haveNext;

  @observable
  ObservableList<Character> _characters = ObservableList();
  @computed
  List<Character> get characters => _characters;
  @action
  // ignore: use_setters_to_change_properties
  void setCharacters(ResponseCharacter value) {
    _haveNext = value.haveMore;
    _characters = value.characters.asObservable();
  }

  @observable
  bool _charactersLoading = false;
  @computed
  bool get charactersLoading => _charactersLoading;
  @action
  // ignore: avoid_positional_boolean_parameters, use_setters_to_change_properties
  void setCharactersLoading(bool newValue) {
    _charactersLoading = newValue;
  }

  @observable
  String _charactersError = "";
  @computed
  String get charactersError => _charactersError;
  @action
  // ignore: use_setters_to_change_properties
  void setCharactersError(String newValue) {
    _charactersError = newValue;
  }

  Future<void> loadCharacters() async {
    setCharactersLoading(true);
    setCharactersError("");
    final characters = await getCharacters(GetCharactersParams());
    characters.fold(
      ifThereWasError,
      setCharacters,
    );
    setCharactersLoading(false);
  }

  @action
  void addNextCharacters(ResponseCharacter value) {
    _haveNext = value.haveMore;
    _characters.addAll(value.characters);
  }

  @observable
  bool _charactersNextLoading = false;
  @computed
  bool get charactersNextLoading => _charactersNextLoading;
  @action
  // ignore: avoid_positional_boolean_parameters, use_setters_to_change_properties
  void setCharactersNextLoading(bool newValue) {
    _charactersNextLoading = newValue;
  }

  @observable
  String _charactersNextError = "";
  @computed
  String get charactersNextError => _charactersNextError;
  @action
  // ignore: use_setters_to_change_properties
  void setCharactersNextError(String newValue) {
    _charactersNextError = newValue;
  }

  Future<void> loadNextCharacters() async {
    setCharactersNextLoading(true);
    setCharactersNextError("");
    final characters = await getCharacters(GetCharactersParams(next: true));
    characters.fold(
      ifThereWasError,
      addNextCharacters,
    );
    setCharactersNextLoading(false);
  }

  void ifThereWasError(Failure failure) {
    if (failure is ServerException) {
      setCharactersError("An error has occurred, check your connection");
    } else if (failure is NoInternetConnectionFailure) {
      setCharactersError(
        "You have no internet access, check your connection",
      );
    } else {
      setCharactersError("An error occurred, please try again later");
    }
  }
}
