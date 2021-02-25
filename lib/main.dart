import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minha_geladeira/views/home_screen.dart';
import 'package:minha_geladeira/views/login_screen.dart';

import 'helpers/helper_functions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool userIsLoggedIn;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await Firebase.initializeApp();
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn  = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minha Geladeira',
      theme: ThemeData(
        floatingActionButtonTheme: new FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black
        ),
        appBarTheme: AppBarTheme(
          color: Colors.deepOrange[300 ],
        ),
        scaffoldBackgroundColor: Colors.deepOrange[300 ],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) 
            return Center(child: Text('ERRO'));
    
          if (snapshot.connectionState == ConnectionState.done)
            return  userIsLoggedIn != null ? userIsLoggedIn ? HomeScreen() : LoginScreen() : LoginScreen();

          if (snapshot.connectionState == ConnectionState.waiting)
            return CircularProgressIndicator();
          
          return CircularProgressIndicator();
        }
      ),
    );
  }
}