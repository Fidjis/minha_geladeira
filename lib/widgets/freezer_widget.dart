import 'package:flutter/material.dart';
import 'package:minha_geladeira/models/freezer_item_model.dart';
import 'package:minha_geladeira/widgets/frezer_item_widget.dart';

class FreezerWidget extends StatefulWidget {
  @override
  _FreezerWidgetState createState() => _FreezerWidgetState();
}

class _FreezerWidgetState extends State<FreezerWidget> {

  _builGenericList()=> ListView.builder(
    itemCount: 10,
    itemBuilder: (context, i) {
      return FreezerItemWidget(
        freezerItemModel: new FreezerItemModel(
          nome: "Arroz", 
          quantidade: 2, 
          tipo: 1
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 4, child: _buildCongelador(context)),
        Expanded(flex: 6, child: _buildParteInferior(context)),
      ],
    );
  }

  Container _buildParteInferior(BuildContext context) {
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
            child: Padding(padding: EdgeInsets.all(10), child: _builGenericList()),
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
            child: Padding(padding: EdgeInsets.all(10), child: _builGenericList()),
          ),
        ),
      );
  }
}