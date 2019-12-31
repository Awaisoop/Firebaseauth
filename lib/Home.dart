
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login/nxtpage.dart';


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController email;

  TextEditingController pass;
@override
  void initState() {
  email = TextEditingController();
  pass = TextEditingController();
    // TODO: implement initState
    super.initState();
  }
  Sinin(){
  String email1 = email.text;
  String pass1 = pass.text;
  var aut = FirebaseAuth.instance;
  aut.createUserWithEmailAndPassword(email: email1, password: pass1).then((res){
if(res.user == null){
  print("Sinup");
}
print(res.user.uid);

  }).catchError((e){
      print(e.toString());
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Form(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 30),
              child: Column(
                children: <Widget>[
                  Image.asset('img/pak.png', fit: BoxFit.contain,
                    width: 250,
                    height: 250,),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    margin: EdgeInsets.only(top: 60),
                    child: Column(
                      children: <Widget>[

                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            hintText: "Email :",
                            icon: Icon(Icons.email, color: Colors.grey,),
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          controller: email,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                        ),
                        TextField(
                          controller: pass,
                          cursorColor: Colors.red,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            hintText: "Password :",
                            icon: Icon(Icons.lock, color: Colors.grey,),
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          autofocus: false,
                          obscureText: true,
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 50),
                            child: RaisedButton(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 150, vertical: 8),
                              child: Text("Login", style: TextStyle(
                                  fontSize: 15,color: Colors.white70),),
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(0.0),
                                  side: BorderSide(color: Colors.cyan)
                              ),
                              onPressed: Sinin(),
                              color: Colors.cyan,
                              textColor: Colors.white,
                            )
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child:Column(
                      children: <Widget>[
                        OutlineButton(
                          child: Text("Forgotten Password"),
                          textColor: Colors.grey,
                          onPressed: (
                              ){},
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}