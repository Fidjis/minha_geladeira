import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:minha_geladeira/helpers/consts.dart';
import 'package:minha_geladeira/helpers/helper_functions.dart';
import 'package:minha_geladeira/stores/principal_store.dart';
import 'package:minha_geladeira/views/historico_screen.dart';
import 'package:minha_geladeira/views/top_five_screen.dart';
import 'package:minha_geladeira/widgets/geladeira_widget.dart';
import 'package:minha_geladeira/widgets/novo_item_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final principalStore = PrincipalSt();

  @override
  void initState() {
    super.initState();
    HelperFunctions.saveUserLoggedInSharedPreference(true);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => SafeArea(
        child: Scaffold(
          drawer: _buildDrawer(),
          key: Consts.scaffoldKey,
          body: _buildBody(),
        )
      )
    );
  }

  showNovoItemDialog() {
    Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return new NovoItemDialog();
      },
      fullscreenDialog: true
    ));
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
            Consts.scaffoldKey.currentState.openDrawer();
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
            showNovoItemDialog();
          },
        ),
      ],
    );
  }

  _buildDrawer() {
    return Drawer(
      child: Container(
        color: Colors.deepOrange[300],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 100.0,
                child: _buildAppName(),
              ),
              decoration: BoxDecoration(
                // color: terciaryColor
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.plus_one,
                color: Colors.white
              ),
              title: Text('Nova Compra', style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pop(context);
                showNovoItemDialog();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.white
              ),
              title: Text("Histórico", style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoricoScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.star,
                color: Colors.white
              ),
              title: Text("Top 5", style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TopFiveScreen()),
                );
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  _buildAppName() {
    return Stack(alignment: Alignment.center, children: <Widget>[
      _buildBackgroundAppName(),
      _buildBackgroundAppNameShadow(),
    ],);
  }

  _buildBackgroundAppName() {
    return Padding(
      //padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 15.0, ),
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0, ),
      child: Text(
        "Minha Geladeira",
        style: TextStyle(
          color: Colors.deepOrange[900],
          fontSize: 30,
          fontFamily: "Lobster",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _buildBackgroundAppNameShadow() {
    return Padding(
      //padding: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 20.0,),
      padding: const EdgeInsets.fromLTRB(7.0, 7.0, 0.0, 0.0,),
      child: Text(
        "Minha Geladeira",
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