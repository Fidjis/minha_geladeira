import 'package:flutter/material.dart';
import 'package:minha_geladeira/widgets/bag_icon.dart';

class FreezerWidget extends StatefulWidget {
  @override
  _FreezerWidgetState createState() => _FreezerWidgetState();
}

class _FreezerWidgetState extends State<FreezerWidget> {

  _builGenericList()=> ListView.builder(
    itemCount: 60,
    itemBuilder: (context, i) {
      return ExpansionTile(
          backgroundColor: Colors.grey.withOpacity(0.1),
          title: ListTile(
            title: Text('Pimenta'),
            // subtitle: Text('Qtd 4'),
          ),
          leading: BagIcon(
            icon: Icon(Icons.food_bank),
          ),
          // leading: CircleAvatar(
          //   backgroundColor: Colors.brown.shade800,
          //   child: Text('N'+ i.toString()),
          // ),
          // trailing: SizedBox(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Herzlich Willkommen"),
                  Spacer(),
                  Icon(Icons.check),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Das Kursmenu"),
                  Spacer(),
                  Icon(Icons.check),
                ],
              ),
            )
          ],
        );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 4, child: Container(
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
            color: Colors.lightBlueAccent,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(padding: EdgeInsets.all(10), child: _builGenericList()),
            ),
          ),
        )),
        Expanded(flex: 6, child: Container(
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
            color: Colors.cyanAccent,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(padding: EdgeInsets.all(10), child: _builGenericList()),
            ),
          ),
        )),
      ],
    );
  }
}