import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justmeet/model/user.dart';
import 'package:justmeet/utils/controllerAPI/user_controller.dart';
import 'package:justmeet/utils/auth_provider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SinginGooglePage extends StatelessWidget {
  const SinginGooglePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = new UserController();
    TextEditingController nome = new TextEditingController();
    TextEditingController cognome = new TextEditingController();
    TextEditingController email = new TextEditingController();
    User newuser;
    return Container(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Nome
            TextField(
             decoration: InputDecoration(
                              labelText: 'Nome',
                              hintText: "Inserisci qui il tuo nome",
                              border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8),)),
                             ),
              controller: nome,
            ),
            //Cognome
            TextField(
              decoration: InputDecoration(
                              labelText: 'Cognome',
                              hintText: "Inserisci qui il tuo cognome",
                              border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8),)),
                             ),
              controller: cognome,
            ),
            //Email
            TextField(
              decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: "Inserisci qui la tua Email",
                              border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8),)),
                             ),
              controller: email,
            ),
            //Button
           
          ],
        ),
      )
    );
  }
}