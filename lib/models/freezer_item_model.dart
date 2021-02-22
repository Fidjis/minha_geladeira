import 'package:flutter/material.dart';

class FreezerItemModel{

  FreezerItemModel({@required String nome, @required int tipo, @required int quantidade}){
    _nome = nome;
    _tipo = tipo;
    _quantidade = quantidade;
  }

  String _nome;

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  int _tipo;

  int get tipo => _tipo;

  set tipo(int tipo) {
    _tipo = tipo;
  }
  
  int _quantidade;

  int get quantidade => _quantidade;

  set quantidade(int quantidade) {
    _quantidade = quantidade;
  }


}