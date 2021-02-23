import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minha_geladeira/helpers/consts.dart';

class NovoItemDialog extends StatefulWidget {
  @override
  _NovoItemDialogState createState() => _NovoItemDialogState();
}

class _NovoItemDialogState extends State<NovoItemDialog> {
  
  final produtoInputController = TextEditingController();
  final qntInputController = TextEditingController();
  String _selectedItem = Consts.TIPOITENS[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.6),
      body: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Consts.padding),
        ),      
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
      ),
    );
  }

  dialogContent(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: Consts.avatarRadius + Consts.padding,
              bottom: Consts.padding,
              left: Consts.padding,
              right: Consts.padding,
            ),
            margin: EdgeInsets.only(top: Consts.avatarRadius),
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(Consts.padding),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              children: <Widget>[
                Text(
                  "Novo Item",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  maxLength: 30, 
                  controller: produtoInputController,
                  decoration: new InputDecoration(
                    hintText: "Produto:",
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  maxLength: 2, 
                  controller: qntInputController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: new InputDecoration(
                    hintText: "Quantidade:",
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Text('Tipo:', textScaleFactor: 1.2,),
                    Spacer(),
                    DropdownButton<String>(
                      value: _selectedItem,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                      items: Consts.TIPOITENS.map((item) {
                        return DropdownMenuItem(
                          child: new Text(item),
                          value: item,
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // To close the dialog
                      },
                      child: Text("Cancelar", style: TextStyle(color: Colors.red)),
                    ),
                    FlatButton(
                      onPressed: () async {
                        if(produtoInputController.text .isEmpty || qntInputController.text.isEmpty)
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: new Text("Preencha todos os campos!"),
                                actions: <Widget>[
                                  new FlatButton(
                                    child: new Text("ok"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        else{
                          //salvarrrrr
                        }
                      },
                      child: Text("Salvar"),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            left: Consts.padding,
            right: Consts.padding,
            child: CircleAvatar(
              child: Image.asset('assets/imgs/ic_launcher.png'),
              backgroundColor: Colors.blueAccent,
              radius: Consts.avatarRadius,
            ),
          ),
        ],
      ),
    );
  }
}