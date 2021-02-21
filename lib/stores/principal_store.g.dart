// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'principal_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PrincipalSt on PrincipalStBase, Store {
  final _$geladeiraAbertaAtom = Atom(name: 'PrincipalStBase.geladeiraAberta');

  @override
  bool get geladeiraAberta {
    _$geladeiraAbertaAtom.reportRead();
    return super.geladeiraAberta;
  }

  @override
  set geladeiraAberta(bool value) {
    _$geladeiraAbertaAtom.reportWrite(value, super.geladeiraAberta, () {
      super.geladeiraAberta = value;
    });
  }

  final _$PrincipalStBaseActionController =
      ActionController(name: 'PrincipalStBase');

  @override
  dynamic abrirGeladeira() {
    final _$actionInfo = _$PrincipalStBaseActionController.startAction(
        name: 'PrincipalStBase.abrirGeladeira');
    try {
      return super.abrirGeladeira();
    } finally {
      _$PrincipalStBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fecharGeladeira() {
    final _$actionInfo = _$PrincipalStBaseActionController.startAction(
        name: 'PrincipalStBase.fecharGeladeira');
    try {
      return super.fecharGeladeira();
    } finally {
      _$PrincipalStBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
geladeiraAberta: ${geladeiraAberta}
    ''';
  }
}
