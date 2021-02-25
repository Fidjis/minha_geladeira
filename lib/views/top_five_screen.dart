import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minha_geladeira/helpers/consts.dart';
import 'package:minha_geladeira/helpers/helper_functions.dart';
import 'package:minha_geladeira/services/database.dart';
import 'package:minha_geladeira/widgets/bag_icon.dart';

class TopFiveScreen extends StatefulWidget {
  @override
  _TopFiveScreenState createState() => _TopFiveScreenState();
}

class _TopFiveScreenState extends State<TopFiveScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TOP 5", style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), 
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder< List<Map<String, dynamic>> >(
        future: DatabaseMethods().getTopFive(userID: Consts.userId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          else{
            return Padding(
              padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 25.0),
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0))
                    ),
                    color: Colors.blueAccent[200].withOpacity(0.2),
                    child: ListTile(
                      leading: BagIcon(
                        assetUrl: HelperFunctions.getImgTipo(snapshot.data[index]["tipo"]), 
                        quantidade: 0,
                      ),
                      title: Text(snapshot.data[index]["nome"], style: TextStyle(color: Colors.white), textScaleFactor: 0.9,),
                      subtitle: Text("Consumidos: " + snapshot.data[index]["quantidade"].toString(), style: TextStyle(color: Colors.white), textScaleFactor: 0.9,),
                      // subtitle: Text('Qtd 4'),
                    ),
                  );
                },
              ),
            );
          }
        }
      ),
    );
  }
}