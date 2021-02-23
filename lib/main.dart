import 'package:flutter/material.dart';
import 'package:minha_geladeira/views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        // textTheme: TextTheme(
        //   bodyText1: TextStyle(),
        //   bodyText2: TextStyle(),
        // ).apply(
        //   bodyColor: Colors.black, 
        //   displayColor: Colors.black, 
        // ),
        scaffoldBackgroundColor: Colors.deepOrange[300 ],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}