import 'package:flutter/material.dart';

class BagIcon extends StatefulWidget {

  final Icon icon;

  BagIcon({Key key, this.icon}) : super(key: key);

  @override
  _BagIconState createState() => _BagIconState();
}

class _BagIconState extends State<BagIcon> {

  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Stack( children: <Widget>[
        // IconButton(icon: widget.icon, onPressed: () {
        //   setState(() {
        //     counter++;
        //   });
        // }),
        Container(
          padding: EdgeInsets.all(4.0),
          child: GestureDetector(
            onTap: () {
             setState(() {
               counter++;
             });
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: widget.icon,
            ),
          ),
        ),
        counter != 0 ? new Positioned(
          right: 0,
          top: 0,
          child: new Container(
            padding: EdgeInsets.all(2),
            decoration: new BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Text(
              '$counter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ) : new Container()
      ],
    );
  }
}