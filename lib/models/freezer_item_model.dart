import 'package:flutter/material.dart';

class FreezerItemModel{

  FreezerItemModel({String id, @required String nome, @required String tipo, @required int quantidade, @required bool congelador}){
    _nome = nome;
    _tipo = tipo;
    _quantidade = quantidade;
    _congelador = congelador;
    _id = id;
  }

  Map<String, dynamic> get toMap => {
    'nome': nome,
    'tipo': tipo,
    'quantidade': quantidade,
    'congelador': congelador,
  };

  bool _congelador;

  bool get congelador => _congelador;

  set congelador(bool congelador) {
    _congelador = congelador;
  }

  String _id;

  String get id => _id;

  set id(String id) {
    _id = id;
  }

  String _nome;

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  String _tipo;

  String get tipo => _tipo;

  set tipo(String tipo) {
    _tipo = tipo;
  }
  
  int _quantidade;

  int get quantidade => _quantidade;

  set quantidade(int quantidade) {
    _quantidade = quantidade;
  }


}

