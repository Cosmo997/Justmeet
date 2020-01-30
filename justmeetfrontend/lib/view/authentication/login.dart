
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:justmeet/utils/firebase_auth.dart';
import 'package:justmeet/utils/theme.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email;
  TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "test@test.it");
    _password = TextEditingController(text: "testtest");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
          margin: EdgeInsets.all(5),
         child: Card(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            color: ThemeHandler.jmTheme().secondaryHeaderColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
            elevation: 10,
           child: Column(
             children: <Widget>[
               Center(
                 child: null //Image.asset('assets/iconaverticale.png')
               ),
               Container(
                 padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                 child: Center(
                   child: Text(
                     "Login",
                     style: TextStyle(
                       fontSize: 20.0,
                       fontWeight: FontWeight.bold
                     ),),
                 ),
               ),
               //Email
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: "Inserisci qui la tua Email",
                      border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8),)),
                     ),
                   ),
                ),
              ),
              const SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: _password,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      alignLabelWithHint: true,
                      hintText: "Inserisci qui la tua Password",
                      border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8),)),
                     ),
                   ),
                ),
              ),
              const SizedBox(height: 10.0,),
              RaisedButton(
                color: ThemeHandler.jmTheme().accentColor,
                child: Text("Login"),
                onPressed: () async {
                  if(_email.text.isEmpty || _password.text.isEmpty)
                  {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Attenzione"),
                          content: Text("Compilare tutti i campi prima di effettuare il Login."),
                        );
                      });}
                  else{
                   bool result = await AuthProvider().singInWithEmail(_email.text, _password.text);
                   if(!result){
                     print("Auth fail");
                   }
                   Navigator.pop(context);
                  }
                },
              ),
              RaisedButton(
                child: Text("Logout"),
                onPressed: () {
                  setState(() {
                    AuthProvider().logOut();
                  });
                },)
           ],),
         ),
       ),
    );
  }
}