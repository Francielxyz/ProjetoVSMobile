// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_imc_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaImcBack on _ListaImcBack, Store {
  final _$listAtom = Atom(name: '_ListaImcBack.list');

  @override
  Future<List<Imc>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Imc>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_ListaImcBackActionController =
      ActionController(name: '_ListaImcBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_ListaImcBackActionController.startAction(
        name: '_ListaImcBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_ListaImcBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
