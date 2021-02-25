import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Consts {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  static String userId = FirebaseAuth.instance.currentUser.uid;
  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
  static List<String> TIPOITENS = [
    'Outro', 
    'Fruta', 
    'Legume', 
    'Carne', 
    'Laticinio',
    'Tempero',
    'Doce',
    'Bebida sem Alcool',
    'Bebida com Alcool',
    'Molho',
  ];
}