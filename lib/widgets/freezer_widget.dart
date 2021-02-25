import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minha_geladeira/helpers/consts.dart';
import 'package:minha_geladeira/models/freezer_item_model.dart';
import 'package:minha_geladeira/services/database.dart';
import 'package:minha_geladeira/widgets/frezer_item_widget.dart';

class FreezerWidget extends StatefulWidget {
  @override
  _FreezerWidgetState createState() => _FreezerWidgetState();
}

class _FreezerWidgetState extends State<FreezerWidget> {

  Stream<QuerySnapshot> itensCongelador;
  Stream<QuerySnapshot> itensGaveta;

  @override
  void initState() {
    DatabaseMethods().getItensCongelador(userID: Consts.userId).then((val) {
      setState(() {
        itensCongelador = val;
      });
    });
    DatabaseMethods().getItensGaveta(userID: Consts.userId).then((val) {
      setState(() {
        itensGaveta = val;
      });
    });
    super.initState();
  }

  _builListCongelador(){
    return StreamBuilder<QuerySnapshot>(
      stream: itensCongelador,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if(snapshot.data.docs.length == 0)
            return Padding(padding: EdgeInsets.all(10), child: Center(child: Image.asset("assets/imgs/frio.png",height: 100.0,),));
          else 
            return Padding(
              // padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 25.0),
              padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, .0),
              child: ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return FreezerItemWidget(
                    freezerItemModel: new FreezerItemModel(
                      nome: snapshot.data.docs[index]["nome"], 
                      quantidade: snapshot.data.docs[index]["quantidade"], 
                      tipo: snapshot.data.docs[index]["tipo"],
                      congelador: snapshot.data.docs[index]["congelador"], 
                      id: snapshot.data.docs[index].id,
                    ),
                  );
                },
              ),
            );
        }
        else
          return Container();
      }
    );
  }

  _builListGavaveta(){
    return StreamBuilder<QuerySnapshot>(
      stream: itensGaveta,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            // padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 25.0),
            padding: EdgeInsets.fromLTRB(.0, 15.0, .0, .0),
            child: ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return FreezerItemWidget(
                  freezerItemModel: new FreezerItemModel(
                    nome: snapshot.data.docs[index]["nome"], 
                    quantidade: snapshot.data.docs[index]["quantidade"], 
                    tipo: snapshot.data.docs[index]["tipo"],
                    congelador: snapshot.data.docs[index]["congelador"],
                    id: snapshot.data.docs[index].id,
                  ),
                );
              },
            ),
          );
        }
        else
          return Container();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 4, child: _buildCongelador(context)),
        Expanded(flex: 6, child: _buildParteInferior(context)),
      ],
    );
  }

  _buildParteInferior(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 25.0, bottom: 19.0, right: 25.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            )
          ),
          elevation: 2,
          color: Colors.white, //Colors.cyanAccent,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(padding: EdgeInsets.all(10), child: _builListGavaveta()),
          ),
        ),
      );
  }

  _buildCongelador(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 25.0, top: 19.0, right: 25.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            )
          ),
          elevation: 2,
          color: Colors.white, // Colors.lightBlueAccent,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: _builListCongelador(),
          ),
        ),
      );
  }
}