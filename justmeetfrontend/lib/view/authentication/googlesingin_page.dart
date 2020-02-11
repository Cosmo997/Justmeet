import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justmeet/model/user.dart';
import 'package:justmeet/utils/controllerjm.dart';
import 'package:justmeet/utils/auth_provider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SinginGooglePage extends StatelessWidget {
  const SinginGooglePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            SignInButton(
              Buttons.Google,
              text: "Iscriviti con google",
              onPressed: () async {
                //Controlli sulle variabili
                if(nome.text.isEmpty || cognome.text.isEmpty || email.text.isEmpty)
                print("Attenzione ai campi");
                else{
                //Creazione account su firebase
                FirebaseUser currentuser = await AuthProvider().singinWithGoogle();
                if(currentuser == null)
                print("Utente null");
                
                newuser = new User(currentuser.providerId, nome.text, cognome.text, email.text);
                bool result = await ControllerJM.postUser(newuser);
                if(result == true){
                print("ISCRITTO");
                Navigator.pop(context);
                }
                else {
                Navigator.pop(context);}
                }
              },
            )
          ],
        ),
      )
    );
  }
}