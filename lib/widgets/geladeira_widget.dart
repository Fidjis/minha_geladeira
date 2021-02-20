import 'dart:async';

import 'package:flutter/material.dart';
import 'package:minha_geladeira/helpers/Consts.dart';
import 'package:minha_geladeira/widgets/bag_message_icon_widget.dart';

class GeladeiraWidget extends StatefulWidget {
  @override
  _GeladeiraWidgetState createState() => _GeladeiraWidgetState();
}

class _GeladeiraWidgetState extends State<GeladeiraWidget> {

  Timer _timer;
  // bool showFirst = true;
  bool showFirst = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildParteInterna(),
        GestureDetector(
          child: _buildPortas(context),
          onTap: () {
            setState((){
              Consts.geladeiraAberta = !Consts.geladeiraAberta;
              showFirst = !showFirst;
            });
          },
        ),
        Align(
          alignment: FractionalOffset.topCenter,
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.45, 
              top: MediaQuery.of(context).size.height * 0.17
            ),
            child: AnimatedOpacity(
              opacity: showFirst  ? 0 : 1,// certo >>>> Consts.geladeiraAberta ? 0 : 1,
              duration: Duration(milliseconds: 300),
              child: Icon(Icons.free_breakfast, color: Colors.blue.withOpacity(0.4),),
            ),
          ),
        ),
        Align(
          alignment: FractionalOffset.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
            child: AnimatedOpacity(
              opacity: showFirst  ? 0 : 1,// certo >>>> Consts.geladeiraAberta ? 0 : 1,
              duration: Duration(milliseconds: 300),
              child: GestureDetector(
                child: BagIconWidget(icon: Icon(Icons.donut_large_rounded, color: Colors.blue.withOpacity(0.4),)),
                onTap: () {
                  setState(() => Consts.geladeiraAberta = !Consts.geladeiraAberta);
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildPortas(BuildContext context) {
    return Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceOut,
                  width: Consts.geladeiraAberta ? 30 : MediaQuery.of(context).size.width,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        topLeft: Radius.circular(80),
                      ),
                      side: BorderSide(
                        color: Colors.redAccent.withOpacity(0.2),
                        width: 15,
                      ),
                    ),
                    child: Container(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceOut,
                  width: Consts.geladeiraAberta ? 30 : MediaQuery.of(context).size.width,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(80),
                        topRight: Radius.circular(80),
                      ),
                      side: BorderSide(
                        color: Colors.green.withOpacity(0.2),
                        width: 15,
                      ),
                    ),
                    child: Container(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],);
  }

  _buildParteInterna() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80.0),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 15,
        ),
      ),
      child: Container(),
    );
  }
}