import 'package:flutter/material.dart';

class BagIcon extends StatefulWidget {

  final String assetUrl;
  final int quantidade;

  BagIcon({@required this.assetUrl, @required this.quantidade});

  @override
  _BagIconState createState() => _BagIconState();
}

class _BagIconState extends State<BagIcon> {

  @override
  Widget build(BuildContext context) {
    return Stack( children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset( widget.assetUrl)//widget.icon,
        ),
        widget.quantidade != 0 ? Positioned(
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
              widget.quantidade.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ) : Container()
      ],
    ) ;
  }
}