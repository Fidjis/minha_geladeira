import 'dart:async';

import 'package:flutter/material.dart';

class BagIconWidget extends StatefulWidget {

  final Icon icon;

  BagIconWidget({Key key, this.icon}) : super(key: key);

  @override
  _BagIconWidgetState createState() => _BagIconWidgetState();
}

class _BagIconWidgetState extends State<BagIconWidget> {

  Timer _timer;
  bool showFirst = true;
  @override
  void initState() {
    _timer = Timer.periodic(new Duration(seconds: 4), (Timer t) {
      setState(() {
        showFirst = !showFirst;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedOpacity(
          opacity: showFirst  ? 0 : 1,// certo >>>> Consts.geladeiraAberta ? 0 : 1,
          duration: Duration(milliseconds: 300),
          child: Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 5),
            decoration: new BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Text(
              'Pressione para abrir a Geladeira',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ),
        Container(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            //backgroundImage: AssetImage('assets/images/avatar_01.png'),
            child: widget.icon,
          ),
        ),
      ],
    );
  }
}