import 'package:flutter/material.dart';

class HistoricoItemModel{

  HistoricoItemModel({@required int data, @required String nome,@required String tipo, @required int quantidade, @required String msg}){
    _nome = nome;
    _quantidade = quantidade;
    _msg = msg;
    _tipo = tipo;
  }

  Map<String, dynamic> get toMap => {
    'nome': nome,
    'quantidade': quantidade,
    'tipo': tipo,
    'msg': msg,
    'data': data,
  };

  String _tipo;

  String get tipo => _tipo;

  set tipo(String tipo) {
    _tipo = tipo;
  }

  int _data;

  int get data => _data;

  set data(int data) {
    _data = data;
  }

  String _msg;

  String get msg => _msg;

  set id(String id) {
    _msg = msg;
  }

  String _nome;

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }
  
  int _quantidade;

  int get quantidade => _quantidade;

  set quantidade(int quantidade) {
    _quantidade = quantidade;
  }


}