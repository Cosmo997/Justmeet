import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:justmeet/classi/user.dart';
import 'package:justmeet/utils/controllerjm.dart';
import 'package:justmeet/utils/firebase_auth.dart';

class SinginPage extends StatefulWidget {
  SinginPage({Key key}) : super(key: key);

  @override
  _SinginPageState createState() => _SinginPageState();
}

class _SinginPageState extends State<SinginPage> {
    FirebaseUser newUser;
    User mongoUser;
    TextEditingController nome;
    TextEditingController cognome;
    TextEditingController email;
    TextEditingController password;
    TextEditingController confermapassword;
    bool _showSecond = false;
    bool esito;

  @override
  void initState() {
    nome = TextEditingController();
    cognome = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confermapassword = TextEditingController();
    super.initState();
    
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
                firstChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Camibio registrazione
                    SignInButton(
                      Buttons.Email,
                      onPressed: () => change(),
                      
                    ),
                    //NOME
                    TextField(
                controller: nome,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  hintText: "Inserisci qui il tuo nome",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8),)),
                            ),
                ),
                    //COGNOME
                    TextField(
                controller: cognome,
                decoration: InputDecoration(
                  labelText: 'Cognome',
                  hintText: "Inserisci qui il tuo cognome",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8),)),
                            ),
              ),
                    //CONTINUA CON GOOGLE
                    SignInButton(
                Buttons.Google,
                text:"Continua con Google",
                onPressed: () async => {
                    if(nome.text.isEmpty || cognome.text.isEmpty)      
                    showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Attenzione"),
                                      content: Text("Compilare tutti i campi"),
                                    );
                              }
                              )
                    else
                    {
                      newUser = await AuthProvider().singinWithGoogle(),
                      mongoUser = new User(newUser.uid, nome.text, cognome.text, newUser.email),
                      esito = await ControllerJM.postUser(mongoUser),
                      print(esito),
                      Navigator.of(context).popUntil(ModalRoute.withName('/'))
                    }
                }
                ),
                      ]
                    ),
                secondChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      //Camibio registrazione
                     SignInButton(
                       Buttons.Google,
                       onPressed: () => change()),
                      //Nome       
                      TextField(
                        controller: nome,
                        decoration: InputDecoration(
                        labelText: 'Nome',
                        hintText: "Inserisci qui il tuo nome",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8),)),
                           ),
                       ),
                      //COGNOME
                      TextField(
                        controller: cognome,
                        decoration: InputDecoration(
                          labelText: 'Cognome',
                          hintText: "Inserisci qui il tuo cognome",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8),)),
                                    ),
                      ),
                      //EMAIL
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: "Inserisci qui la tua email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8),)),
                                      ),
                      ),
                      //PASSWORD
                      TextField(
                        controller: password,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: "Inserisci qui la tua password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8),)),
                                      ),
                      ),
                      //CONFERMA PASSWORD
                      TextField(
                        controller: confermapassword,
                        decoration: InputDecoration(
                            labelText: 'Re-Password',
                            hintText: "Renserisci qui la tua password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8),)),
                                      ),
                      ),
                      //LOGIN
                         SignInButton(
                Buttons.Email,
                text:"Login",
                onPressed: () async => {
                    if(nome.text.isEmpty || cognome.text.isEmpty || email.text.isEmpty || password.text.isEmpty || confermapassword.text.isEmpty || confermapassword.text != password.text)      
                    showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Attenzione"),
                                      content: Text("Compilare tutti i campi"),
                                    );
                              }
                              )
                    else
                    {
                      newUser = AuthProvider().creaUtenteFirebase(email.text, password.text),
                      if(newUser == null)
                      showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Boh"),
                                      content: Text("Problema"),
                                    );
                              }
                              )
                      else{
                      print(await AuthProvider.getUId()),
                      mongoUser = new User(await AuthProvider.getUId(), nome.text, cognome.text, newUser.email),
                      print(mongoUser.toString()),
                      esito = await ControllerJM.postUser(mongoUser),
                      print("Esito mongo: " + esito.toString()),
                      print("Esito firebase: "+ AuthProvider.getUId().toString()),
                      Navigator.of(context).popUntil(ModalRoute.withName('/'))
                      }

                    }
                }
                )
                  ]
                ),
                crossFadeState: _showSecond
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 400)),
            duration: Duration(milliseconds: 300),
            )
    );
  }



  void change(){
  setState(() {
    _showSecond = !_showSecond;
  });
}
}
