
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:justmeet/utils/firebase_auth.dart';
import 'package:justmeet/utils/theme.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email;
  TextEditingController _password;
  bool _showSecond = false;
  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "test@test.it");
    _password = TextEditingController(text: "testtest");
  }

  @override
  Widget build(BuildContext context) {
    
    

  return BottomSheet(
          
          enableDrag: true,
          onClosing: () {},
          builder: (BuildContext context) => 
            AnimatedContainer(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30)),
            child: AnimatedCrossFade(
                firstChild: Container(
                  color: Colors.transparent,
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Image.asset('assets/images/iconaverticale.png', scale: 1.5,)
                       ),
                        Container(
                          height: 300,
                          child: Card(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: ThemeHandler.jmTheme().secondaryHeaderColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
              elevation: 0,
             child: Column(
               children: <Widget>[
                 
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
                            change();
                          }
                  },
                ),

                SignInButton(Buttons.Google, onPressed:() async{ 
                  bool result = await AuthProvider().loginWithGoogle();
                  if(result == false)
                  {
                          print("Login con google fallito");
                  }
                   change();
                  },
                  
                  )
             ],),
           ),
                        ),
                      ],
                    ),
                      ),
                secondChild: Container(
                  constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height / 3),
                  padding: EdgeInsets.all(20),
                  child: Align(
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
                          Text("ok"),
                        ],
                      ),
                    ),
                  ),
                ),
                crossFadeState: _showSecond
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 400)),
            duration: Duration(milliseconds: 300),
          ),
        );    
  }

void change(){
  setState(() {
    _showSecond = true;
  });
}
  
}