import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:justmeet/model/user.dart';
import 'package:justmeet/utils/controllerjm.dart';
import 'package:justmeet/utils/auth_provider.dart';

class SignUpPage extends StatefulWidget {

  @override
  SignUpPageState createState() => SignUpPageState();
    
  }
  
  class SignUpPageState extends State<SignUpPage> {


    Future<FirebaseUser> newUser;
    Future<String> idUser;
    String usercur;
    User mongoUser;
    TextEditingController nome;
    TextEditingController cognome;
    TextEditingController email;
    TextEditingController password;
    TextEditingController confermapassword;
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

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                    Image.asset('assets/images/iconaverticale.png', scale: 2,),
                    
                    //Nome
                   TextField(
                     maxLength: 15,
                     controller: nome,
                     decoration: InputDecoration(
                    labelText: 'Nome',
                    hintText: "Inserisci qui il tuo nome",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8),)),
                      ),
                   ),

                   //Cognome
                   TextField(
                     maxLength: 15,
                   
                     controller: cognome,
                     decoration: InputDecoration(
                    labelText: 'Cognome',
                    hintText: "Inserisci qui il tuo cognome",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8),)),
                     ),
                   ),

                   //Email
                   TextField(
                     maxLength: 25,
               
                     controller: email,
                     decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: "Inserisci qui il tuo cognome",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8),)),
                        ),
                   ),

                   //Password
                    TextField(
                      maxLength: 15,
                      controller: password,
                      decoration: InputDecoration(
                        labelText: 'Password',
                          hintText: "Inserisci qui la tua password",
                           border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8),)),
                      ),
                    ),

                    //Re-Password
                    TextField(
                      maxLength: 15,
                      controller: confermapassword,
                      decoration: InputDecoration(
                        labelText: 'Re-Password',
                          hintText: "Inserisci qui la tua password",
                           border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8),)),
                      ),
                    ),

                    //SignUp Button
                    SignInButton(
                      Buttons.Email,
                      onPressed: () async => {
                         if(nome.text.isEmpty || cognome.text.isEmpty || email.text.isEmpty || password.text.isEmpty || confermapassword.text.isEmpty || confermapassword.text != password.text)
                         {
                         showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        //TODO Spostare in errore_comp_widget.dart
                        return AlertDialog(
                          title: new Text("Errore nella compilazione"),
                          content: new Text("Attenzione, uno o piu campi non sono stati compilati correttamente, o le password inserite non corrispondono"),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                              child: new Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
    )
                         }
                         else{
                           //print("email: " +email.text+ " password: " +password.text),
                           idUser = AuthProvider().signUp(email.text, password.text),
                           //print("idUser: " + await idUser),
                           usercur = await idUser,
                           //print("usercur: " +usercur),
                           mongoUser = new User(usercur, nome.text, cognome.text, email.text),
                           esito = await ControllerJM.postUser(mongoUser),
                           //print("Esito post:  " +esito.toString()),
                          Navigator.of(context).popUntil(ModalRoute.withName('/'))
                         }
                      },
                    )
                 ],
               ),
          ),
        ),
      ),
    );
    }
}