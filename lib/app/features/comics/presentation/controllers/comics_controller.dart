import 'package:mobx/mobx.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/comic.dart';
import '../../domain/entities/response_comics.dart';
import '../../domain/usecases/get_comics.dart';

part 'comics_controller.g.dart';

class ComicsController = _ComicsControllerBase with _$ComicsController;

abstract class _ComicsControllerBase with Store {
  final int characterId;
  final GetComics getComics;

  _ComicsControllerBase({
    required this.characterId,
    required this.getComics,
  });

  @observable
  bool _haveNext = true;
  @computed
  bool get haveNext => _haveNext;

  @observable
  ObservableList<Comic> _comics = ObservableList();
  @computed
  List<Comic> get comics => _comics;
  @action
  // ignore: use_setters_to_change_properties
  void setComics(ResponseComics value) {
    _haveNext = value.haveMore;
    _comics = value.comics.asObservable();
  }

  @observable
  bool _comicsLoading = false;
  @computed
  bool get comicsLoading => _comicsLoading;
  @action
  // ignore: avoid_positional_boolean_parameters, use_setters_to_change_properties
  void setComicsLoading(bool newValue) {
    _comicsLoading = newValue;
  }

  @observable
  String _comicsError = "";
  @computed
  String get comicsError => _comicsError;
  @action
  // ignore: use_setters_to_change_properties
  void setComicsError(String newValue) {
    _comicsError = newValue;
  }

  Future<void> loadComics({bool isRefresh = false}) async {
    if (!isRefresh) {
      setComicsLoading(true);
    }
    setComicsError("");
    final comics = await getComics(GetComicsParams(characterId: characterId));
    comics.fold(
      (l) => ifThereWasError(l, setComicsError),
      setComics,
    );
    if (!isRefresh) {
      setComicsLoading(false);
    }
  }

  @action
  void addNextComics(ResponseComics value) {
    _haveNext = value.haveMore;
    _comics.addAll(value.comics);
  }

  @observable
  bool _comicsNextLoading = false;
  @computed
  bool get comicsNextLoading => _comicsNextLoading;
  @action
  // ignore: avoid_positional_boolean_parameters, use_setters_to_change_properties
  void setComicsNextLoading(bool newValue) {
    _comicsNextLoading = newValue;
  }

  @observable
  String _comicsNextError = "";
  @computed
  String get comicsNextError => _comicsNextError;
  @action
  // ignore: use_setters_to_change_properties
  void setComicsNextError(String newValue) {
    _comicsNextError = newValue;
  }

  Future<void> loadNextComics() async {
    setComicsNextLoading(true);
    setComicsNextError("");
    final comics =
        await getComics(GetComicsParams(next: true, characterId: characterId));
    comics.fold(
      (l) => ifThereWasError(l, setComicsNextError),
      addNextComics,
    );
    setComicsNextLoading(false);
  }

  void ifThereWasError(Failure failure, void Function(String) setError) {
    if (failure is ServerFailure) {
      setError("An error has occurred, check your connection");
    } else if (failure is NoInternetConnectionFailure) {
      setError(
        "You have no internet access, check your connection",
      );
    } else {
      setError("An error occurred, please try again later");
    }
  }
}
