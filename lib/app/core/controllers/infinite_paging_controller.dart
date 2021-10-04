import 'package:mobx/mobx.dart';

import '../entities/response_data.dart';
import '../error/failure.dart';
import '../usecases/usecase.dart';

part 'infinite_paging_controller.g.dart';

abstract class InfinitePagingController<T, Params> = _InfinitePagingControllerBase<T, Params>
    with _$InfinitePagingController<T, Params>;

abstract class _InfinitePagingControllerBase<T, Params> with Store {
  @observable
  bool _haveNext = true;
  @computed
  bool get haveNext => _haveNext;

  @observable
  ObservableList<T> _objects = ObservableList();
  @computed
  List<T> get objects => _objects;
  @action
  // ignore: use_setters_to_change_properties
  void setObjects(ResponseData<T> value) {
    _haveNext = value.haveMore;
    _objects = value.result.asObservable();
  }

  @observable
  bool _objectsLoading = false;
  @computed
  bool get objectsLoading => _objectsLoading;
  @action
  // ignore: avoid_positional_boolean_parameters, use_setters_to_change_properties
  void setObjectsLoading(bool newValue) {
    _objectsLoading = newValue;
  }

  @observable
  String _objectsError = "";
  @computed
  String get objectsError => _objectsError;
  @action
  // ignore: use_setters_to_change_properties
  void setObjectsError(String newValue) {
    _objectsError = newValue;
  }

  Future<void> loadObjects({
    required UseCase<ResponseData<T>, Params> usecase,
    required Params params,
    bool isRefresh = false,
  }) async {
    if (!isRefresh) {
      setObjectsLoading(true);
    }
    setObjectsError("");
    final objects = await usecase(params);
    objects.fold(
      (r) => ifThereWasError(r, setObjectsError),
      setObjects,
    );
    if (!isRefresh) {
      setObjectsLoading(false);
    }
  }

  @action
  void addNextObjects(ResponseData<T> value) {
    _haveNext = value.haveMore;
    _objects.addAll(value.result);
  }

  @observable
  bool _objectsNextLoading = false;
  @computed
  bool get objectsNextLoading => _objectsNextLoading;
  @action
  // ignore: avoid_positional_boolean_parameters, use_setters_to_change_properties
  void setObjectsNextLoading(bool newValue) {
    _objectsNextLoading = newValue;
  }

  @observable
  String _objectsNextError = "";
  @computed
  String get objectsNextError => _objectsNextError;
  @action
  // ignore: use_setters_to_change_properties
  void setObjectsNextError(String newValue) {
    _objectsNextError = newValue;
  }

  Future<void> loadNextObjects({
    required UseCase<ResponseData<T>, Params> usecase,
    required Params params,
  }) async {
    setObjectsNextLoading(true);
    setObjectsNextError("");
    final objects = await usecase(params);
    objects.fold(
      (r) => ifThereWasError(r, setObjectsNextError),
      addNextObjects,
    );
    setObjectsNextLoading(false);
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
