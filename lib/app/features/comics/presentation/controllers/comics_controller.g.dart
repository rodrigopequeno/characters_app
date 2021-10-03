// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comics_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ComicsController on _ComicsControllerBase, Store {
  Computed<bool>? _$haveNextComputed;

  @override
  bool get haveNext =>
      (_$haveNextComputed ??= Computed<bool>(() => super.haveNext,
              name: '_ComicsControllerBase.haveNext'))
          .value;
  Computed<List<Comic>>? _$comicsComputed;

  @override
  List<Comic> get comics =>
      (_$comicsComputed ??= Computed<List<Comic>>(() => super.comics,
              name: '_ComicsControllerBase.comics'))
          .value;
  Computed<bool>? _$comicsLoadingComputed;

  @override
  bool get comicsLoading =>
      (_$comicsLoadingComputed ??= Computed<bool>(() => super.comicsLoading,
              name: '_ComicsControllerBase.comicsLoading'))
          .value;
  Computed<String>? _$comicsErrorComputed;

  @override
  String get comicsError =>
      (_$comicsErrorComputed ??= Computed<String>(() => super.comicsError,
              name: '_ComicsControllerBase.comicsError'))
          .value;
  Computed<bool>? _$comicsNextLoadingComputed;

  @override
  bool get comicsNextLoading => (_$comicsNextLoadingComputed ??= Computed<bool>(
          () => super.comicsNextLoading,
          name: '_ComicsControllerBase.comicsNextLoading'))
      .value;
  Computed<String>? _$comicsNextErrorComputed;

  @override
  String get comicsNextError => (_$comicsNextErrorComputed ??= Computed<String>(
          () => super.comicsNextError,
          name: '_ComicsControllerBase.comicsNextError'))
      .value;

  final _$_haveNextAtom = Atom(name: '_ComicsControllerBase._haveNext');

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

  final _$_comicsAtom = Atom(name: '_ComicsControllerBase._comics');

  @override
  ObservableList<Comic> get _comics {
    _$_comicsAtom.reportRead();
    return super._comics;
  }

  @override
  set _comics(ObservableList<Comic> value) {
    _$_comicsAtom.reportWrite(value, super._comics, () {
      super._comics = value;
    });
  }

  final _$_comicsLoadingAtom =
      Atom(name: '_ComicsControllerBase._comicsLoading');

  @override
  bool get _comicsLoading {
    _$_comicsLoadingAtom.reportRead();
    return super._comicsLoading;
  }

  @override
  set _comicsLoading(bool value) {
    _$_comicsLoadingAtom.reportWrite(value, super._comicsLoading, () {
      super._comicsLoading = value;
    });
  }

  final _$_comicsErrorAtom = Atom(name: '_ComicsControllerBase._comicsError');

  @override
  String get _comicsError {
    _$_comicsErrorAtom.reportRead();
    return super._comicsError;
  }

  @override
  set _comicsError(String value) {
    _$_comicsErrorAtom.reportWrite(value, super._comicsError, () {
      super._comicsError = value;
    });
  }

  final _$_comicsNextLoadingAtom =
      Atom(name: '_ComicsControllerBase._comicsNextLoading');

  @override
  bool get _comicsNextLoading {
    _$_comicsNextLoadingAtom.reportRead();
    return super._comicsNextLoading;
  }

  @override
  set _comicsNextLoading(bool value) {
    _$_comicsNextLoadingAtom.reportWrite(value, super._comicsNextLoading, () {
      super._comicsNextLoading = value;
    });
  }

  final _$_comicsNextErrorAtom =
      Atom(name: '_ComicsControllerBase._comicsNextError');

  @override
  String get _comicsNextError {
    _$_comicsNextErrorAtom.reportRead();
    return super._comicsNextError;
  }

  @override
  set _comicsNextError(String value) {
    _$_comicsNextErrorAtom.reportWrite(value, super._comicsNextError, () {
      super._comicsNextError = value;
    });
  }

  final _$_ComicsControllerBaseActionController =
      ActionController(name: '_ComicsControllerBase');

  @override
  void setComics(ResponseComics value) {
    final _$actionInfo = _$_ComicsControllerBaseActionController.startAction(
        name: '_ComicsControllerBase.setComics');
    try {
      return super.setComics(value);
    } finally {
      _$_ComicsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComicsLoading(bool newValue) {
    final _$actionInfo = _$_ComicsControllerBaseActionController.startAction(
        name: '_ComicsControllerBase.setComicsLoading');
    try {
      return super.setComicsLoading(newValue);
    } finally {
      _$_ComicsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComicsError(String newValue) {
    final _$actionInfo = _$_ComicsControllerBaseActionController.startAction(
        name: '_ComicsControllerBase.setComicsError');
    try {
      return super.setComicsError(newValue);
    } finally {
      _$_ComicsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNextComics(ResponseComics value) {
    final _$actionInfo = _$_ComicsControllerBaseActionController.startAction(
        name: '_ComicsControllerBase.addNextComics');
    try {
      return super.addNextComics(value);
    } finally {
      _$_ComicsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComicsNextLoading(bool newValue) {
    final _$actionInfo = _$_ComicsControllerBaseActionController.startAction(
        name: '_ComicsControllerBase.setComicsNextLoading');
    try {
      return super.setComicsNextLoading(newValue);
    } finally {
      _$_ComicsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComicsNextError(String newValue) {
    final _$actionInfo = _$_ComicsControllerBaseActionController.startAction(
        name: '_ComicsControllerBase.setComicsNextError');
    try {
      return super.setComicsNextError(newValue);
    } finally {
      _$_ComicsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
haveNext: ${haveNext},
comics: ${comics},
comicsLoading: ${comicsLoading},
comicsError: ${comicsError},
comicsNextLoading: ${comicsNextLoading},
comicsNextError: ${comicsNextError}
    ''';
  }
}
