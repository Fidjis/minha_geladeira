import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                  onPressed: () {
                    consumirProdutoDiolog(context, false);
                  },
                  child: Row(children: <Widget> [
                    Image.asset("assets/imgs/chapeu.png", width: 20.0,height: 20.0,),
                    SizedBox(width: 3,),
                    Text("UTILIZAR", style: TextStyle(color: Colors.white), textScaleFactor: 0.9,),
                  ],),
                ),
                FlatButton(
                  padding: EdgeInsets.all(5.0),
                  onPressed: () {
                    consumirProdutoDiolog(context, true);
                  },
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

  consumirProdutoDiolog(BuildContext context, bool comer) {
    final formKey = GlobalKey<FormState>();
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(comer ? "Quantos você comeu?" : "Quantos você utlizou na receita?", textAlign: TextAlign.center,),
                subtitle: Text(comer ? "Espero que esteja gostoso!" : "Espero que tenha ficado bom!", textAlign: TextAlign.center,),
              ),
              SizedBox(height: 30.0,),
              Form(
                key: formKey,
                child: TextFormField(
                  validator: (value){
                    if(value != null)
                      if (int.parse(value) > widget.freezerItemModel.quantidade) 
                        return 'Você tem apenas: ' + widget.freezerItemModel.quantidade.toString();
                  },
                  maxLength: 2, 
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: new InputDecoration(
                    hintText: "Quantidade:",
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            new FlatButton(
              child: new Text("Salvar"),
              onPressed: () {
                if (formKey.currentState.validate()) {
                  print('SALVO');
                }
              },
            ),
          ],
        );
      },
    );
  }
  
}