import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:justmeet/utils/controllerAPI/evento_controller.dart';
import 'package:justmeet/utils/theme.dart';
import 'package:justmeet/utils/viewtype.dart';
import 'package:justmeet/widget/appbar_widget.dart';
import 'package:justmeet/widget/drawer_widget.dart';
import 'package:justmeet/widget/view_event_widget.dart';

import '../../model/user.dart';
import '../../utils/auth_provider.dart';
import '../../utils/controllerAPI/user_controller.dart';
import '../authentication/googlesingin_page.dart';

class GuestHomePage extends StatefulWidget{
  @override
    GuestHomePageState createState() => GuestHomePageState();
  }

class GuestHomePageState extends State<GuestHomePage>{
  EventoController eventoController = new EventoController();
  bool _showSecond = false;   
  UserController userController = new UserController();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "prova@prova.com");
    _password = TextEditingController(text: "provaprova");
  }

  void change(){
  setState(() {
    _showSecond = true;
  });
}
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar:JMAppBar(),
    drawer: JMDrawer(),
    body: ViewEvent(type: ViewType.GUEST_HOME,events: eventoController.loadEventsApproved()),
    floatingActionButton: FloatingActionButton(
      backgroundColor: ThemeHandler.jmTheme().accentColor,
      child: Icon(Icons.lock_outline, color: ThemeHandler.jmTheme().primaryColor),
      onPressed: () => { 
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) { 
                    return Container(
                      color: Colors.transparent,
                      height: 600,
                      child: Column(
          children: <Widget>[
            AnimatedContainer(
                  child: AnimatedCrossFade(
                  firstChild: Column(
                  children: <Widget>[
                    Stack(
                 children: <Widget>[
                  Container(
                  width: 400,
                  height: MediaQuery.of(context).size.height -80,
                  color: Colors.transparent,
                    ),
                  Positioned(
                    top: 80,
                    left: 5,
                    right: 5,
                      child: Container(
                      width: 300,
                      height: 380,
                      color: Colors.transparent,
                      child: Card(
                            margin: EdgeInsets.fromLTRB(10, 1, 10, 10),
                            color: ThemeHandler.jmTheme().secondaryHeaderColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                            elevation: 10,
                            child: Column(
                              children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
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
                                           shape: RoundedRectangleBorder(
                                           borderRadius: new BorderRadius.circular(18.0),
                                        ),
                                            color: ThemeHandler.jmTheme().accentColor,
                                            child: Text("Login"),
                                            onPressed: () async {
                                                    if(_email.text.isEmpty || _password.text.isEmpty){
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Text("Attenzione"),
                                                            content: Text("Compilare tutti i campi prima di effettuare il Login."),
                                                          );
                                                        });}
                                                    else{
                                                    bool result = await AuthProvider().singInWithEmail(_email.text, _password.text);
                                                    print(result.toString());
                                                    if(result == true){
                                                      Navigator.pop(context);
                                                    }else
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return AlertDialog(
                                                            title: Text("Attenzione"),
                                                            content: Text("Ricontrollare i cambi inseriti"),
                                                          );
                                                        });
                                                    }
                                            },
                                          ),
                                          SignInButton(
                                            Buttons.Google, 
                                            onPressed:() async{
                                              Future<String> currentId = AuthProvider().loginWithGoogle();
                                              sleep(Duration(seconds: 2));
                                              Future<User> user = userController.getUserById(currentId);
                                              await user;
                                              String id = await currentId;
                                              if(user == null){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => SinginGooglePage(id: id)));
                                              }
                                              else 
                                              print("User loggato");
                                              Navigator.pop(context);
                                            }
                                          ),
                                            RaisedButton(
                                              shape: RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(18.0),
                                          ),
                                                color: ThemeHandler.jmTheme().accentColor,
                                                child: Text("Iscriviti"),
                                                onPressed: () => Navigator.of(context).pushNamed("/signup"),
                                              )
                                        ],
                                        ),
                      ),
                    ),
                  ),
                  Positioned(
                   left: 55,
                   right: 55,
                   top: -75,
                     child: Image.asset('assets/images/iconaverticale.png', scale: 1.5,)
                ),
       ],
      ),
                  ],
                  ),
                  secondChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            constraints: BoxConstraints.expand(
                                height: MediaQuery.of(context).size.height / 3),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Text("Autenticazione Completata", style: TextStyle(fontSize: 20),),
                                Divider(color: Colors.orange, height: 20,),
                                Image.asset('assets/images/ok2.png', scale: 5,),
                                Divider(height: 10,),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: RaisedButton(
                                    onPressed: () => Navigator.pop(context),
                                    color: Colors.green,
                                    padding: EdgeInsets.all(15),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Continua"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    crossFadeState: _showSecond
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: Duration(milliseconds: 400),
        ),
                    duration: Duration(milliseconds: 300),
            ),
      ],
    ),
                      );
                    },
                  ),
              }
            ));          
          }
    }
/*
  Column stackTendina(BuildContext context){

        return Column(
          children: <Widget>[
            AnimatedContainer(
                  child: AnimatedCrossFade(
                  firstChild: Column(
                  children: <Widget>[
                    Stack(
                 children: <Widget>[
                  Container(
                  width: 400,
                  height: MediaQuery.of(context).size.height -80,
                  color: Colors.transparent,
                    ),
                  Positioned(
                    top: 80,
                    left: 5,
                    right: 5,
                      child: Container(
                      width: 300,
                      height: 380,
                      color: Colors.transparent,
                      child: Card(
                            margin: EdgeInsets.fromLTRB(10, 1, 10, 10),
                            color: ThemeHandler.jmTheme().secondaryHeaderColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                            elevation: 10,
                            child: Column(
                              children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
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
                                           shape: RoundedRectangleBorder(
                                           borderRadius: new BorderRadius.circular(18.0),
                                        ),
                                            color: ThemeHandler.jmTheme().accentColor,
                                            child: Text("Login"),
                                            onPressed: () async {
                                                    if(_email.text.isEmpty || _password.text.isEmpty){
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Text("Attenzione"),
                                                            content: Text("Compilare tutti i campi prima di effettuare il Login."),
                                                          );
                                                        });}
                                                    else{
                                                    bool result = await AuthProvider().singInWithEmail(_email.text, _password.text);
                                                    print(result.toString());
                                                    if(result == true){
                                                      Navigator.pop(context);
                                                    }else
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return AlertDialog(
                                                            title: Text("Attenzione"),
                                                            content: Text("Ricontrollare i cambi inseriti"),
                                                          );
                                                        });
                                                    }
                                            },
                                          ),
                                          SignInButton(
                                            Buttons.Google, 
                                            onPressed:() async{
                                              Future<String> currentId = AuthProvider().loginWithGoogle();
                                              sleep(Duration(seconds: 2));
                                              Future<User> user = userController.getUserById(currentId);
                                              await user;
                                              String id = await currentId;
                                              if(user == null){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => SinginGooglePage(id: id)));
                                              }
                                              else 
                                              print("User loggato");
                                              Navigator.pop(context);
                                            }
                                          ),
                                            RaisedButton(
                                              shape: RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(18.0),
                                          ),
                                                color: ThemeHandler.jmTheme().accentColor,
                                                child: Text("Iscriviti"),
                                                onPressed: () => Navigator.of(context).pushNamed("/signup"),
                                              )
                                        ],
                                        ),
                      ),
                    ),
                  ),
                  Positioned(
                   left: 55,
                   right: 55,
                   top: -75,
                     child: Image.asset('assets/images/iconaverticale.png', scale: 1.5,)
                ),
       ],
      ),
                  ],
                  ),
                  secondChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            constraints: BoxConstraints.expand(
                                height: MediaQuery.of(context).size.height / 3),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Text("Autenticazione Completata", style: TextStyle(fontSize: 20),),
                                Divider(color: Colors.orange, height: 20,),
                                Image.asset('assets/images/ok2.png', scale: 5,),
                                Divider(height: 10,),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: RaisedButton(
                                    onPressed: () => Navigator.pop(context),
                                    color: Colors.green,
                                    padding: EdgeInsets.all(15),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Continua"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    crossFadeState: _showSecond
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: Duration(milliseconds: 400),
        ),
                    duration: Duration(milliseconds: 300),
            ),
      ],
    );
  }
*/
  

  UserController userController = new UserController();
  TextEditingController _email;
  TextEditingController _password;
