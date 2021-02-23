import 'package:flutter/material.dart';
import 'package:minha_geladeira/widgets/bag_icon.dart';

class HistoricoScreen extends StatefulWidget {
  @override
  _HistoricoScreenState createState() => _HistoricoScreenState();
}

class _HistoricoScreenState extends State<HistoricoScreen> {

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
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40.0))
              ),
              color: Colors.blueAccent[200].withOpacity(0.2),
              child: ListTile(
                leading: BagIcon(
                  assetUrl: "assets/imgs/chapeu.png", 
                  quantidade: 0,
                ),
                title: Text("Bombom", style: TextStyle(color: Colors.white), textScaleFactor: 0.9,),
                subtitle: Text("Voce comeu/comprou 1", style: TextStyle(color: Colors.white), textScaleFactor: 0.9,),
                // subtitle: Text('Qtd 4'),
              ),
            );
          },
        ),
      ),
    );
  }
}