import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minha_geladeira/helpers/helper_functions.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController01 = new TextEditingController();
  TextEditingController loginPasswordController02 = new TextEditingController();
  bool _obscureTextLogin = true;
  bool newAcount = false;
  bool visibleSenha2 = false;
  double heightNewAcount = 0;
  var primaryColor = const Color(0xFFda5e5a);
  var segundaryColor = Colors.white;
  var terciaryColor = const Color(0xFFe89b98);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomSheet: buildBottomSheet(),
      backgroundColor: segundaryColor,
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                color: terciaryColor,
                borderRadius: new BorderRadius.only(
                  bottomLeft:  const  Radius.circular(40.0),
                  bottomRight: const  Radius.circular(40.0)
                )
              ),
              //height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 25.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  buildLoginText(),
                  _buildSignIn(context),
                ],
              )
            ),
            Positioned(
              bottom: 0.0,
              right: 15.0,
              child: FloatingActionButton.extended(
                onPressed: (){
                  setState(() {
                    if(newAcount){
                      heightNewAcount = 0;
                      visibleSenha2 = false;
                    } else {
                      heightNewAcount = 90;
                      //newAcount = false;
                    } 
                  });
                },
                heroTag: "criar_conta",
                label: Text(newAcount ? "Tenho Conta" :"Criar Conta", style: TextStyle(color: Colors.white)),
                backgroundColor: primaryColor,
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 15.0,
              child: FloatingActionButton.extended(
                onPressed: (){
                  showInSnackBar("Aguarde as atualizações");
                },
                heroTag: "login_google",
                label: Text("G", style: TextStyle(color: Colors.white)),
                backgroundColor: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildBottomSheet() {
    return Container(
      decoration: new BoxDecoration(
        color: terciaryColor,
        borderRadius: new BorderRadius.only(
          topRight: const  Radius.circular(150.0)
        )
      ),
      height: 150,
      width: 150,
    );
  }

  login(){
    if (loginPasswordController01.text != '' && loginEmailController.text != '')
      try{
        FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: loginEmailController.text,
                  password: loginPasswordController01.text)
              .then((currentUser) => FirebaseFirestore.instance
                  .collection("users")
                  .doc(currentUser.user.uid)
                  .get()
                  .then((DocumentSnapshot result) =>
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen())))
                  .catchError((err) => showInSnackBar('Verifique as informações!')))
              .catchError((err) => showInSnackBar('Verifique as informações!'));
      }catch(e){
        showInSnackBar('Verifique as informações!');
      }
  }

  createUserLogin() {
    try {
      if (loginPasswordController01.text != '' && loginEmailController.text != '') {
        if (loginPasswordController01.text == loginPasswordController02.text) { //confirmando senhas
          FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: loginEmailController.text,
                password: loginPasswordController01.text)
            .then((currentUser) => FirebaseFirestore.instance
                .collection("users")
                .doc(currentUser.user.uid)
                .set({
                  "id": currentUser.user.uid,
                  "email": loginEmailController.text,
                })
                .then((result) => {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()),
                          (_) => false),
                      loginEmailController.clear(),
                      loginPasswordController01.clear(),
                      loginPasswordController02.clear()
                    })
                .catchError((err) => showInSnackBar('Verifique as informações!')))
            .catchError((err) => showInSnackBar('Verifique as informações!'));
        } else {
          showInSnackBar('Senha incorreta!');
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  buildLoginText() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 15.0, ),
          child: Text(
            "Login",
            style: TextStyle(
              color: primaryColor,
              fontSize: 50,
              fontFamily: "Lobster",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 20.0,),
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontFamily: "Lobster",
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: terciaryColor,
      duration: Duration(seconds: 3),
    ));
  }

  Widget _buildSignIn(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                height: 280,
                child: Center(
                  child: Card(
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: AnimatedContainer(
                      duration: new Duration(milliseconds: 650),
                      width: 300.0,
                      //height: newAcount? 270.0 : 190.0,
                      height: heightNewAcount != 0 ? 270.0 : 190.0,
                      child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                              child: TextField(
                                controller: loginEmailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  fontFamily: "WorkSansSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.black54,
                                    size: 22.0,
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                                ),
                              ),
                            ),
                            Container(
                              width: 250.0,
                              height: 1.0,
                              color: Colors.grey[400],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                              child: TextField(
                                controller: loginPasswordController01,
                                obscureText: _obscureTextLogin,
                                style: TextStyle(
                                  fontFamily: "WorkSansSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.lock,
                                    size: 22.0,
                                    color: Colors.black54,
                                  ),
                                  hintText: "Senha",
                                  hintStyle: TextStyle(
                                    fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                                  suffixIcon: GestureDetector(
                                    onTap: _toggleLogin,
                                    child: Icon(
                                      _obscureTextLogin
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                      size: 15.0,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //confirmar senha
                            AnimatedContainer(
                              duration: new Duration(milliseconds: 700),
                              height: heightNewAcount,
                              onEnd: (){
                                setState(() {
                                  if(!newAcount)
                                    visibleSenha2 = true;
                                  newAcount = !newAcount;
                                });
                              },
                              child: Visibility(
                                visible: visibleSenha2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      width: 250.0,
                                      height: 1.0,
                                      color: Colors.grey[400],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                                      child: TextField(
                                        controller: loginPasswordController02,
                                        obscureText: _obscureTextLogin,
                                        style: TextStyle(
                                          fontFamily: "WorkSansSemiBold",
                                          fontSize: 16.0,
                                          color: Colors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Icon(
                                            Icons.lock,
                                            size: 22.0,
                                            color: Colors.black54,
                                          ),
                                          hintText: "Confirmar Senha",
                                          hintStyle: TextStyle(
                                            fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                                          suffixIcon: GestureDetector(
                                            onTap: _toggleLogin,
                                            child: Icon(
                                              _obscureTextLogin
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                              size: 15.0,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: FloatingActionButton.extended(
              onPressed: (){
                setState(() {
                  //heightNewAcount = 0;
                  //newAcount = false;
                  if(newAcount)
                    createUserLogin();
                  else
                    login();
                });
              },
                heroTag: "login",
              label: Text("Login", style: TextStyle(color: Colors.white)),
              backgroundColor: primaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: FlatButton(
              onPressed: () {
                showInSnackBar("Aguarde as atualizações");
              },
              child: Text(
                "Esqueceu a senha?",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: segundaryColor,
                  fontSize: 16.0,
                  fontFamily: "WorkSansMedium"),
              )
            ),
          ),
          buildDivisor(),
        ],
      ),
    );
  }

  Padding buildDivisor() {
    return Padding(
      padding: EdgeInsets.only(top: 0.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                colors: [
                  Colors.white10,
                  Colors.white,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            ),
            width: 100.0,
            height: 1.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(
              "Ou",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontFamily: "WorkSansMedium"),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white10,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            ),
            width: 100.0,
            height: 1.0,
          ),
        ],
      ),
    );
  }

}