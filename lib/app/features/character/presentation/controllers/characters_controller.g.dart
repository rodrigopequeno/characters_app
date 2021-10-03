// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharactersController on _CharactersControllerBase, Store {
  Computed<List<Character>>? _$charactersComputed;

  @override
  List<Character> get characters => (_$charactersComputed ??=
          Computed<List<Character>>(() => super.characters,
              name: '_CharactersControllerBase.characters'))
      .value;
  Computed<bool>? _$snackBarIsVisibleComputed;

  @override
  bool get snackBarIsVisible => (_$snackBarIsVisibleComputed ??= Computed<bool>(
          () => super.snackBarIsVisible,
          name: '_CharactersControllerBase.snackBarIsVisible'))
      .value;

  final _$_snackBarIsVisibleAtom =
      Atom(name: '_CharactersControllerBase._snackBarIsVisible');

  @override
  bool get _snackBarIsVisible {
    _$_snackBarIsVisibleAtom.reportRead();
    return super._snackBarIsVisible;
  }

  @override
  set _snackBarIsVisible(bool value) {
    _$_snackBarIsVisibleAtom.reportWrite(value, super._snackBarIsVisible, () {
      super._snackBarIsVisible = value;
    });
  }

  @override
  String toString() {
    return '''
characters: ${characters},
snackBarIsVisible: ${snackBarIsVisible}
    ''';
  }
}
