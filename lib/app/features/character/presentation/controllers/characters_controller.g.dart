// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharactersController on _CharactersControllerBase, Store {
  Computed<bool>? _$haveNextComputed;

  @override
  bool get haveNext =>
      (_$haveNextComputed ??= Computed<bool>(() => super.haveNext,
              name: '_CharactersControllerBase.haveNext'))
          .value;
  Computed<List<Character>>? _$charactersComputed;

  @override
  List<Character> get characters => (_$charactersComputed ??=
          Computed<List<Character>>(() => super.characters,
              name: '_CharactersControllerBase.characters'))
      .value;
  Computed<bool>? _$charactersLoadingComputed;

  @override
  bool get charactersLoading => (_$charactersLoadingComputed ??= Computed<bool>(
          () => super.charactersLoading,
          name: '_CharactersControllerBase.charactersLoading'))
      .value;
  Computed<String>? _$charactersErrorComputed;

  @override
  String get charactersError => (_$charactersErrorComputed ??= Computed<String>(
          () => super.charactersError,
          name: '_CharactersControllerBase.charactersError'))
      .value;
  Computed<bool>? _$charactersNextLoadingComputed;

  @override
  bool get charactersNextLoading => (_$charactersNextLoadingComputed ??=
          Computed<bool>(() => super.charactersNextLoading,
              name: '_CharactersControllerBase.charactersNextLoading'))
      .value;
  Computed<String>? _$charactersNextErrorComputed;

  @override
  String get charactersNextError => (_$charactersNextErrorComputed ??=
          Computed<String>(() => super.charactersNextError,
              name: '_CharactersControllerBase.charactersNextError'))
      .value;

  final _$_haveNextAtom = Atom(name: '_CharactersControllerBase._haveNext');

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

  final _$_charactersAtom = Atom(name: '_CharactersControllerBase._characters');

  @override
  ObservableList<Character> get _characters {
    _$_charactersAtom.reportRead();
    return super._characters;
  }

  @override
  set _characters(ObservableList<Character> value) {
    _$_charactersAtom.reportWrite(value, super._characters, () {
      super._characters = value;
    });
  }

  final _$_charactersLoadingAtom =
      Atom(name: '_CharactersControllerBase._charactersLoading');

  @override
  bool get _charactersLoading {
    _$_charactersLoadingAtom.reportRead();
    return super._charactersLoading;
  }

  @override
  set _charactersLoading(bool value) {
    _$_charactersLoadingAtom.reportWrite(value, super._charactersLoading, () {
      super._charactersLoading = value;
    });
  }

  final _$_charactersErrorAtom =
      Atom(name: '_CharactersControllerBase._charactersError');

  @override
  String get _charactersError {
    _$_charactersErrorAtom.reportRead();
    return super._charactersError;
  }

  @override
  set _charactersError(String value) {
    _$_charactersErrorAtom.reportWrite(value, super._charactersError, () {
      super._charactersError = value;
    });
  }

  final _$_charactersNextLoadingAtom =
      Atom(name: '_CharactersControllerBase._charactersNextLoading');

  @override
  bool get _charactersNextLoading {
    _$_charactersNextLoadingAtom.reportRead();
    return super._charactersNextLoading;
  }

  @override
  set _charactersNextLoading(bool value) {
    _$_charactersNextLoadingAtom
        .reportWrite(value, super._charactersNextLoading, () {
      super._charactersNextLoading = value;
    });
  }

  final _$_charactersNextErrorAtom =
      Atom(name: '_CharactersControllerBase._charactersNextError');

  @override
  String get _charactersNextError {
    _$_charactersNextErrorAtom.reportRead();
    return super._charactersNextError;
  }

  @override
  set _charactersNextError(String value) {
    _$_charactersNextErrorAtom.reportWrite(value, super._charactersNextError,
        () {
      super._charactersNextError = value;
    });
  }

  final _$_CharactersControllerBaseActionController =
      ActionController(name: '_CharactersControllerBase');

  @override
  void setCharacters(ResponseCharacter value) {
    final _$actionInfo = _$_CharactersControllerBaseActionController
        .startAction(name: '_CharactersControllerBase.setCharacters');
    try {
      return super.setCharacters(value);
    } finally {
      _$_CharactersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCharactersLoading(bool newValue) {
    final _$actionInfo = _$_CharactersControllerBaseActionController
        .startAction(name: '_CharactersControllerBase.setCharactersLoading');
    try {
      return super.setCharactersLoading(newValue);
    } finally {
      _$_CharactersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCharactersError(String newValue) {
    final _$actionInfo = _$_CharactersControllerBaseActionController
        .startAction(name: '_CharactersControllerBase.setCharactersError');
    try {
      return super.setCharactersError(newValue);
    } finally {
      _$_CharactersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNextCharacters(ResponseCharacter value) {
    final _$actionInfo = _$_CharactersControllerBaseActionController
        .startAction(name: '_CharactersControllerBase.addNextCharacters');
    try {
      return super.addNextCharacters(value);
    } finally {
      _$_CharactersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCharactersNextLoading(bool newValue) {
    final _$actionInfo =
        _$_CharactersControllerBaseActionController.startAction(
            name: '_CharactersControllerBase.setCharactersNextLoading');
    try {
      return super.setCharactersNextLoading(newValue);
    } finally {
      _$_CharactersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCharactersNextError(String newValue) {
    final _$actionInfo = _$_CharactersControllerBaseActionController
        .startAction(name: '_CharactersControllerBase.setCharactersNextError');
    try {
      return super.setCharactersNextError(newValue);
    } finally {
      _$_CharactersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
haveNext: ${haveNext},
characters: ${characters},
charactersLoading: ${charactersLoading},
charactersError: ${charactersError},
charactersNextLoading: ${charactersNextLoading},
charactersNextError: ${charactersNextError}
    ''';
  }
}
