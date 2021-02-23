import 'package:flutter/material.dart';
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 25.0),
        child: ListView.builder(
          itemCount: 5,
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
                subtitle: Text("Consumidos: 99", style: TextStyle(color: Colors.white), textScaleFactor: 0.9,),
                // subtitle: Text('Qtd 4'),
              ),
            );
          },
        ),
      ),
    );
  }
}