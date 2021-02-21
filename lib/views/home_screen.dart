import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:minha_geladeira/stores/principal_store.dart';
import 'package:minha_geladeira/widgets/geladeira_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final principalStore = PrincipalSt();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: _buildDrawer(),
          body: _buildBody(),
        )
      )
    );
  }

  _buildBody() => Padding(
    padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 25.0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 40.0, right: 40.0),
          child: _buildGeladeiraMenu(),
        ),
        //_buildGeladeiraMenu(),
        //SizedBox(height: 10),
        Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          color: Colors.white,
          height: 1.5, 
          width: MediaQuery.of(context).size.width / 2,
        ),
        Flexible(
          child: GeladeiraWidget(),
        ),
      ],
    ),
  );

  _buildGeladeiraMenu() {
    return Row(
      children: [
        FloatingActionButton(
          child: Icon(Icons.menu),
          mini: true,
          heroTag: "open drawer",
          onPressed: () { 
            //_scaffoldKey.currentState.openDrawer();
          }, 
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
          ),
        ),
        AnimatedOpacity(
          opacity: principalStore.geladeiraAberta ? 1 : 0,
          duration: Duration(milliseconds: 300),
          child: FloatingActionButton.extended(
            heroTag: "fab fechar",
            onPressed: () => principalStore.fecharGeladeira(),
            label: Text("Fechar"),
          ),
        ),
        FloatingActionButton(
          child: Icon(Icons.add_shopping_cart),
          mini: true,
          heroTag: "add item",
          onPressed: () { 
            
          },
        ),
      ],
    );
  }

  _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 100.0,
            child: Stack(alignment: Alignment.center, children: <Widget>[
                buildBackgroundAppName(),
                buildBackgroundAppNameShadow(),
              ],),
            ),
            decoration: BoxDecoration(
              // color: terciaryColor
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
            alignment: Alignment.center,
            child: Text(
              "“Se você almeja ser rico, pense em poupar assim como você pensa em ganhar.” – Benjamin Franklin",
              //textScaleFactor: 0.9,
              textAlign: TextAlign.center,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.plus_one,
              // color: primaryColor,
            ),
            title: Text('Novo Registro'),
            onTap: () {
              Navigator.pop(context);
              // showDialogCustomNovoRegistro();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.monetization_on,
              // color: primaryColor,
            ),
            title: Text("Minhas Metas"),
            onTap: () {
              Navigator.pop(context);
              // openMinhasMetasDialog();
            },
          ),
          //buildButtonConfig(),
          ListTile(
            leading: Icon(
              Icons.lock,
              // color: primaryColor,
            ),
            title: Text("Politica de Privacidade"),
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
              // );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              // color: primaryColor,
            ),
            title: Text("Sobre"),
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SobreScreen()),
              // );
            },
          ),
          Divider(),
        ],
      ),
    );
  }

  Padding buildBackgroundAppName() {
    return Padding(
      //padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 15.0, ),
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0, ),
      child: Text(
        "Meta Econômica",
        style: TextStyle(
          // color: primaryColor,
          fontSize: 30,
          fontFamily: "Lobster",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding buildBackgroundAppNameShadow() {
    return Padding(
      //padding: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 20.0,),
      padding: const EdgeInsets.fromLTRB(7.0, 7.0, 0.0, 0.0,),
      child: Text(
        "Meta Econômica",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontFamily: "Lobster",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}