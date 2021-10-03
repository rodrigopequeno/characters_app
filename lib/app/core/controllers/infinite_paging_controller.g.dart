// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infinite_paging_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InfinitePagingController<T, Params>
    on _InfinitePagingControllerBase<T, Params>, Store {
  Computed<bool>? _$haveNextComputed;

  @override
  bool get haveNext =>
      (_$haveNextComputed ??= Computed<bool>(() => super.haveNext,
              name: '_InfinitePagingControllerBase.haveNext'))
          .value;
  Computed<List<T>>? _$objectsComputed;

  @override
  List<T> get objects =>
      (_$objectsComputed ??= Computed<List<T>>(() => super.objects,
              name: '_InfinitePagingControllerBase.objects'))
          .value;
  Computed<bool>? _$objectsLoadingComputed;

  @override
  bool get objectsLoading =>
      (_$objectsLoadingComputed ??= Computed<bool>(() => super.objectsLoading,
              name: '_InfinitePagingControllerBase.objectsLoading'))
          .value;
  Computed<String>? _$objectsErrorComputed;

  @override
  String get objectsError =>
      (_$objectsErrorComputed ??= Computed<String>(() => super.objectsError,
              name: '_InfinitePagingControllerBase.objectsError'))
          .value;
  Computed<bool>? _$objectsNextLoadingComputed;

  @override
  bool get objectsNextLoading => (_$objectsNextLoadingComputed ??=
          Computed<bool>(() => super.objectsNextLoading,
              name: '_InfinitePagingControllerBase.objectsNextLoading'))
      .value;
  Computed<String>? _$objectsNextErrorComputed;

  @override
  String get objectsNextError => (_$objectsNextErrorComputed ??=
          Computed<String>(() => super.objectsNextError,
              name: '_InfinitePagingControllerBase.objectsNextError'))
      .value;

  final _$_haveNextAtom = Atom(name: '_InfinitePagingControllerBase._haveNext');

  @override
  bool get _haveNext {
    _$_haveNextAtom.reportRead();
    return super._haveNext;
  }

  @override
  set _haveNext(bool value) {
    _$_haveNextAtom.reportWrite(value, super._haveNext, () {
      super._haveNext = value;
    });
  }

  final _$_objectsAtom = Atom(name: '_InfinitePagingControllerBase._objects');

  @override
  ObservableList<T> get _objects {
    _$_objectsAtom.reportRead();
    return super._objects;
  }

  @override
  set _objects(ObservableList<T> value) {
    _$_objectsAtom.reportWrite(value, super._objects, () {
      super._objects = value;
    });
  }

  final _$_objectsLoadingAtom =
      Atom(name: '_InfinitePagingControllerBase._objectsLoading');

  @override
  bool get _objectsLoading {
    _$_objectsLoadingAtom.reportRead();
    return super._objectsLoading;
  }

  @override
  set _objectsLoading(bool value) {
    _$_objectsLoadingAtom.reportWrite(value, super._objectsLoading, () {
      super._objectsLoading = value;
    });
  }

  final _$_objectsErrorAtom =
      Atom(name: '_InfinitePagingControllerBase._objectsError');

  @override
  String get _objectsError {
    _$_objectsErrorAtom.reportRead();
    return super._objectsError;
  }

  @override
  set _objectsError(String value) {
    _$_objectsErrorAtom.reportWrite(value, super._objectsError, () {
      super._objectsError = value;
    });
  }

  final _$_objectsNextLoadingAtom =
      Atom(name: '_InfinitePagingControllerBase._objectsNextLoading');

  @override
  bool get _objectsNextLoading {
    _$_objectsNextLoadingAtom.reportRead();
    return super._objectsNextLoading;
  }

  @override
  set _objectsNextLoading(bool value) {
    _$_objectsNextLoadingAtom.reportWrite(value, super._objectsNextLoading, () {
      super._objectsNextLoading = value;
    });
  }

  final _$_objectsNextErrorAtom =
      Atom(name: '_InfinitePagingControllerBase._objectsNextError');

  @override
  String get _objectsNextError {
    _$_objectsNextErrorAtom.reportRead();
    return super._objectsNextError;
  }

  @override
  set _objectsNextError(String value) {
    _$_objectsNextErrorAtom.reportWrite(value, super._objectsNextError, () {
      super._objectsNextError = value;
    });
  }

  final _$_InfinitePagingControllerBaseActionController =
      ActionController(name: '_InfinitePagingControllerBase');

  @override
  void setObjects(ResponseData<T> value) {
    final _$actionInfo = _$_InfinitePagingControllerBaseActionController
        .startAction(name: '_InfinitePagingControllerBase.setObjects');
    try {
      return super.setObjects(value);
    } finally {
      _$_InfinitePagingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObjectsLoading(bool newValue) {
    final _$actionInfo = _$_InfinitePagingControllerBaseActionController
        .startAction(name: '_InfinitePagingControllerBase.setObjectsLoading');
    try {
      return super.setObjectsLoading(newValue);
    } finally {
      _$_InfinitePagingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObjectsError(String newValue) {
    final _$actionInfo = _$_InfinitePagingControllerBaseActionController
        .startAction(name: '_InfinitePagingControllerBase.setObjectsError');
    try {
      return super.setObjectsError(newValue);
    } finally {
      _$_InfinitePagingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNextObjects(ResponseData<T> value) {
    final _$actionInfo = _$_InfinitePagingControllerBaseActionController
        .startAction(name: '_InfinitePagingControllerBase.addNextObjects');
    try {
      return super.addNextObjects(value);
    } finally {
      _$_InfinitePagingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObjectsNextLoading(bool newValue) {
    final _$actionInfo =
        _$_InfinitePagingControllerBaseActionController.startAction(
            name: '_InfinitePagingControllerBase.setObjectsNextLoading');
    try {
      return super.setObjectsNextLoading(newValue);
    } finally {
      _$_InfinitePagingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObjectsNextError(String newValue) {
    final _$actionInfo = _$_InfinitePagingControllerBaseActionController
        .startAction(name: '_InfinitePagingControllerBase.setObjectsNextError');
    try {
      return super.setObjectsNextError(newValue);
    } finally {
      _$_InfinitePagingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
haveNext: ${haveNext},
objects: ${objects},
objectsLoading: ${objectsLoading},
objectsError: ${objectsError},
objectsNextLoading: ${objectsNextLoading},
objectsNextError: ${objectsNextError}
    ''';
  }
}
