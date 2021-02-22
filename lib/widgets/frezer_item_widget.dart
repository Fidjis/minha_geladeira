import 'package:flutter/material.dart';
import 'package:minha_geladeira/models/freezer_item_model.dart';
import 'package:minha_geladeira/widgets/bag_icon.dart';

class FreezerItemWidget extends StatefulWidget {

  final FreezerItemModel freezerItemModel;

  FreezerItemWidget({@required this.freezerItemModel});

  @override
  _FreezerItemWidgetState createState() => _FreezerItemWidgetState();
}

class _FreezerItemWidgetState extends State<FreezerItemWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40.0))
      ),
      color: Colors.blueAccent[200].withOpacity(0.2),
      child: ExpansionTile(
        title: ListTile(
          title: Center(child: Text(widget.freezerItemModel.nome, style: TextStyle(color: Colors.white), textScaleFactor: 0.9,)),
          // subtitle: Text('Qtd 4'),
        ),
        leading: BagIcon(
          assetUrl: "assets/imgs/chapeu.png", 
          quantidade: widget.freezerItemModel.quantidade,
        ),
        children: <Widget>[
          Container(
            height: 60.0,
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.all(5.0),
                  onPressed: () {  },
                  child: Row(children: <Widget> [
                    Image.asset("assets/imgs/chapeu.png", width: 20.0,height: 20.0,),
                    SizedBox(width: 3,),
                    Text("UTILIZAR", style: TextStyle(color: Colors.white), textScaleFactor: 0.9,),
                  ],),
                ),
                FlatButton(
                  padding: EdgeInsets.all(5.0),
                  onPressed: () {  },
                  child: Row(children: <Widget> [
                    Text("COMER", style: TextStyle(color: Colors.white), textScaleFactor: 0.9,),
                    SizedBox(width: 3,),
                    Image.asset("assets/imgs/comer.png", width: 20.0,height: 20.0,),
                  ],),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}