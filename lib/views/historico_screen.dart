import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minha_geladeira/helpers/consts.dart';
import 'package:minha_geladeira/helpers/helper_functions.dart';
import 'package:minha_geladeira/services/database.dart';
import 'package:minha_geladeira/widgets/bag_icon.dart';

class HistoricoScreen extends StatefulWidget {
  @override
  _HistoricoScreenState createState() => _HistoricoScreenState();
}

class _HistoricoScreenState extends State<HistoricoScreen> {

  Stream<QuerySnapshot> itensHistorico;

  @override
  void initState() {
    DatabaseMethods().getItensHistorico(userID: Consts.userId).then((val) {
      setState(() {
        itensHistorico = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Histórico", style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), 
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: itensHistorico,
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return Padding(
              padding: EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0))
                    ),
                    color: Colors.blueAccent[200].withOpacity(0.2),
                    child: ListTile(
                      leading: BagIcon(
                        assetUrl: HelperFunctions.getImgTipo(snapshot.data.docs[index]["tipo"]), //"assets/imgs/chapeu.png", 
                        quantidade: 0,
                      ),
                      title: Text(snapshot.data.docs[index]["nome"], style: TextStyle(color: Colors.white), textScaleFactor: 0.9,),
                      subtitle: Text(snapshot.data.docs[index]["msg"] + ": " + snapshot.data.docs[index]["quantidade"].toString(), style: TextStyle(color: Colors.white), textScaleFactor: 0.9,),
                      // subtitle: Text('Qtd 4'),
                    ),
                  );
                },
              ),
            );
          else
            return Container();
        }
      ),
    );
  }
}